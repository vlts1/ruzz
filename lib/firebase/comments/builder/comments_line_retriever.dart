import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/comment/comment_data.dart';
import 'package:ruzz/comments/comments_page/comment/update_info.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/likes_count/likes_count_retriever.dart';
import 'package:ruzz/firebase/comments/comments_from_position.dart';
import 'package:ruzz/firebase/comments/oldest_comments.dart';
import 'package:ruzz/firebase/comments/relative_path/relative_path_receiver.dart';
import 'package:ruzz/firebase/replies/replies_checker.dart';
import 'package:ruzz/providers/comments/comments_loading_status.dart';
import 'package:ruzz/providers/comments/updates_last_loaded_comment.dart';
import 'package:ruzz/providers/comments/loaded_comments.dart';
import 'package:ruzz/providers/current_user_info.dart';
import 'package:ruzz/providers/replies/replies_loading_status.dart';
import '../../../providers/profile_images_provider.dart';
import '../../users/user_public_info.dart';

class CommentsLineRetriever {
  CommentsLineRetriever(this.technology, this.version, this.context);

  final String       technology;
  final String       version;
  final BuildContext context;

  late final _commentsProvider        = Provider.of<LoadedComments>          (context, listen: false);
  late final _commentsLoadingProvider = Provider.of<CommentsLoadingStatus>   (context, listen: false);
  late final _repliesLoadingProvider  = Provider.of<RepliesLoadingStatus>    (context, listen: false);
  late final _currentUserInfo         = Provider.of<CurrentUserInfo>         (context, listen: false);
  late final _versionsLastComment     = Provider.of<UpdatesLastLoadedComment>(context, listen: false);

  late final oldest         = OldestComments      (technology, version);
  late final fromPosition   = CommentsFromPosition(technology, version);
  final     _repliesChecker = RepliesChecker();
  final     _pathMod        = RelativePathReceiver();

  bool _preventFromLoading = false;

  Future<void> loadMore() async {
    final isLoadingDone = _commentsLoadingProvider.isLoadingDone(technology, version);

    if (_preventFromLoading || isLoadingDone) return;
    _preventFromLoading = true;

    QuerySnapshot commentsSnap;
    final lastComment = _versionsLastComment.getLastLoaded(technology, version);

    if (lastComment == null) {
      commentsSnap = await oldest.top10;
    } else {
      commentsSnap = await fromPosition.getAfter(lastComment);
    }

    if (commentsSnap.docs.isEmpty) {
      _commentsLoadingProvider.markAsLoaded(technology, version);
      debugPrint('CommentsLineRetreiver: still tries to load');
      _preventFromLoading = true;
      return;
    }

    _versionsLastComment.setLastLoaded(technology, version, commentsSnap.docs.last);

    final likeRetrievers = <LikesCountRetriever>[];
    for (var doc in commentsSnap.docs) {
      final likesCountRetriever = LikesCountRetriever.fromComment(doc, _currentUserInfo.docId);
      likesCountRetriever.init();
      likeRetrievers.add(likesCountRetriever);
    }

    final commentHasReplies = <Future<bool>>[];
    for (var doc in commentsSnap.docs) {
      Future<bool> hasReplies = _repliesChecker.commentHasReplies(doc.id);
      commentHasReplies.add(hasReplies);
    }

    for (int docId = 0; docId < commentsSnap.docs.length; docId++) {
      await likeRetrievers[docId].init();

      final hasReplies = await commentHasReplies[docId];
      final retriever  = likeRetrievers[docId];
      final doc        = commentsSnap.docs[docId];
      final postedOn   = doc.get('date') as Timestamp;
      final updateInfo = UpdateInfo(technology, version);

      final commentData = CommentData(
        retriever,
        UserPublicInfo.fromComment(
          doc, 
          _currentUserInfo, 
          Provider.of<ProfileImagesProvider>(context, listen: false),
        ),
        postedOn.toDate(),
        doc.get('body'),
        _pathMod.toRelative(doc.reference.path),
        _pathMod.toRelative(doc.get('user_id').toString()),
        updateInfo,
      );

      if (hasReplies == false) _repliesLoadingProvider.markAsLoaded(commentData.commentId);
      _commentsProvider.addLocalComment(commentData);
    }
    _preventFromLoading = false;
  }
}