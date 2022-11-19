import 'package:cloud_firestore/cloud_firestore.dart';

class RepliesChecker {
  Future<bool> commentHasReplies(String commentId) async {
    final replies = await FirebaseFirestore.instance
        .collection('comments')
        .doc(commentId)
        .collection('replies')
        .limit(1)
        .get();
    
    return replies.docs.isNotEmpty;
  }
}
