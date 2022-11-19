import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/firebase/comments/builder/firestore_comments_local_saver.dart';

class CommentsBeforePosition {
  CommentsBeforePosition(this.context);
  final BuildContext context;
  late final firestoreCommentsLocalSaver = FirestoreCommentsLocalSaver(context);
  Future<void> loadEarlierComments(String commentId) async {
    final comment = await FirebaseFirestore.instance
        .collection('comments')
        .doc(commentId)
        .get(GetOptions(source: Source.server));
    
    /// The order must be the same as the one in [OldestComments]
    final commentsBefore = await FirebaseFirestore.instance
        .collection('comments')
        .where("technology", isEqualTo: comment.get('technology'))
        .where("version",    isEqualTo: comment.get('version'))
        .orderBy("date")
        .startAfterDocument(comment)
        .get(GetOptions(source: Source.server));

    await firestoreCommentsLocalSaver.saveLocally(commentsBefore.docs);
  }
}