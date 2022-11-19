import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/providers/profile_images_provider.dart';

import '../../../comments/comments_page/comment/comment_data.dart';
import '../../../comments/comments_page/comment/update_info.dart';
import '../../../comments/comments_preview/comment_preview/likes_count/likes_count_retriever.dart';
import '../../../providers/comments/loaded_comments.dart';
import '../../../providers/current_user_info.dart';
import '../../replies/replies_line_retriever.dart';
import '../../users/user_public_info.dart';
import '../relative_path/relative_path_receiver.dart';

class FirestoreCommentsLocalSaver {
  FirestoreCommentsLocalSaver(this.context);
  final BuildContext context;
  final _pathMod = RelativePathReceiver();

  late final _currentUserInfo = Provider.of<CurrentUserInfo>(
    context,
    listen: false,
  );

  late final _commentsProvider = Provider.of<LoadedComments>(
    context,
    listen: false,
  );

  Future<void> saveLocally(List<DocumentSnapshot<Object?>> comments) async {
    debugPrint('FirestoreCommentsLocalSaver: trying to save locally');
    final repliesLoading = <Future<void>>[];
    for (var doc in comments) {
      final repliesLineReceiver = RepliesLineRetriever(doc.id);
      repliesLoading.add(repliesLineReceiver.load(context));
    }

    final likeRetrievers = <LikesCountRetriever>[];
    for (var doc in comments) {
      final likesCountRetriever = LikesCountRetriever.fromComment(doc, _currentUserInfo.docId);
      likesCountRetriever.init();
      likeRetrievers.add(likesCountRetriever);
    }

    for (int docId = 0; docId < comments.length; docId++) {
      await likeRetrievers[docId].init();
      await repliesLoading[docId];

      final retriever = likeRetrievers[docId];
      final doc = comments[docId];
      final postedOn = doc.get('date') as Timestamp;
      final updateInfo = UpdateInfo(doc.get('technology'), doc.get('version'));

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

      _commentsProvider.addLocalComment(commentData);
    }
  }
}
