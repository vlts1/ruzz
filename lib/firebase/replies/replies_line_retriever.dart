import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/reply/reply_data.dart';
import 'package:ruzz/comments/comments_page/reply/reply_receiver.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/likes_count/likes_count_retriever.dart';
import 'package:ruzz/firebase/comments/relative_path/relative_path_receiver.dart';
import 'package:ruzz/providers/replies/loaded_replies.dart';
import '../../providers/current_user_info.dart';
import '../../providers/profile_images_provider.dart';
import '../../providers/replies/replies_loading_status.dart';
import '../users/user_public_info.dart';
import 'oldest_replies.dart';

class RepliesLineRetriever {
  RepliesLineRetriever(this.originalCommentId);

  final String originalCommentId;

  late final _pathMod      = RelativePathReceiver();
  bool _preventParallelLoading = false;

  Future<void> load(BuildContext context) async {
    if (_preventParallelLoading) return;
    _preventParallelLoading = true;
    
    final repliesLoadingProvider = Provider.of<RepliesLoadingStatus>(context, listen: false);
    if (repliesLoadingProvider.isLoadingDone(originalCommentId)) {
      _preventParallelLoading = false;
      return;
    }
    final repliesProvider        = Provider.of<LoadedReplies>  (context, listen: false);
    final currentUserInfo        = Provider.of<CurrentUserInfo>(context, listen: false);

    final oldestReplies = OldestReplies(originalCommentId);

    QuerySnapshot commentsSnap = await oldestReplies.replies;

    if (commentsSnap.docs.isEmpty) {
      repliesLoadingProvider.markAsLoaded(originalCommentId);
      _preventParallelLoading = false;
      return;
    }

    final likeRetrievers = <LikesCountRetriever>[];
    for (var doc in commentsSnap.docs) {
      final likesCountRetriever = LikesCountRetriever.fromComment(doc, currentUserInfo.docId);
      likesCountRetriever.init();
      likeRetrievers.add(likesCountRetriever);
    }

    for (int docId = 0; docId < commentsSnap.docs.length; docId++) {
      await likeRetrievers[docId].init();

      final retriever = likeRetrievers[docId];
      final doc = commentsSnap.docs[docId];
      final postedOn = doc.get('date') as Timestamp;
      ReplyReceiver replyReceiver;
      try {
        replyReceiver = ReplyReceiver(
          doc.get('receiver'),
          _pathMod.toRelative(doc.get('receiver_id').toString()),
        );
      } catch (e) {
        replyReceiver = ReplyReceiver("", "");
      }

      final replyData = ReplyData(
        retriever,
        UserPublicInfo.fromComment(
          doc, 
          currentUserInfo, 
          Provider.of<ProfileImagesProvider>(context, listen: false),
        ),
        postedOn.toDate(),
        doc.get('body'),
        _pathMod.toRelative(doc.get('user_id').toString()),
        originalCommentId,
        _pathMod.toRelative(doc.reference.path),
        replyReceiver,
      );
      repliesProvider.addLocalReply(replyData);
    }
    debugPrint('loaded $originalCommentId with ' + likeRetrievers.length.toString() + ' replies');
    repliesLoadingProvider.markAsLoaded(originalCommentId);
    _preventParallelLoading = false;
  }
}
