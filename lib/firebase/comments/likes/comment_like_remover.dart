import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:ruzz/firebase/comments/likes/comment_liked_by_user.dart';

class CommentLikeRemover {
  CommentLikeRemover(this.postPath, this.userId);
  final String postPath;
  final String userId;

  late final commentLikedByUser = CommentLikedByUser(postPath, userId);

  Future<bool> removeLike() async {
    if (await commentLikedByUser.isCommentLiked == false) {
      debugPrint("CommentLikeRemover: comment is not liked");
      return false;
    }

    final likedCommentReference  = FirebaseFirestore.instance.doc(postPath);
    final thisUserLikerReference = FirebaseFirestore.instance.collection('users').doc(userId);

    final like = await FirebaseFirestore.instance
        .collection('likes')
        .where('liker_user_id', isEqualTo: thisUserLikerReference)
        .where('post_id',       isEqualTo: likedCommentReference)
        .limit(1)
        .get();


    if (like.docs.isEmpty == false) {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.delete(like.docs.first.reference);
      });
      return true;
    }
    return false;
  }
}
