import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class OldestReplies {
  OldestReplies(this.originalCommentId);
  final String originalCommentId;

  Future<QuerySnapshot<Map<String, dynamic>>> get replies async {
    final replies = await FirebaseFirestore.instance
        .collection('comments')
        .doc(originalCommentId)
        .collection('replies')
        .orderBy('date')
        .get(GetOptions(source: Source.server));
    debugPrint('OldestReplies length: ' + replies.docs.length.toString());
    return replies;
  }
}
