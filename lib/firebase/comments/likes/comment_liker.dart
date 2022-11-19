import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:ruzz/firebase/comments/likes/comment_liked_by_user.dart';

class CommentLiker {
  CommentLiker(this.postPath, this.likerId, this.postWriterId);
  final String postPath;
  final String likerId;
  final String postWriterId;

  late final _commentLikedByUser = CommentLikedByUser(postPath, likerId);

  Future<bool> likeComment() async {
    if (await _commentLikedByUser.isCommentLiked == true) {
      debugPrint("CommentLiker: comment is already liked");
      return false;
    }
    final postToLikeReference    = FirebaseFirestore.instance.doc(postPath);
    final thisUserLikerReference = FirebaseFirestore.instance.collection('users')   .doc(likerId);
    final postWriterReference    = FirebaseFirestore.instance.collection('users')   .doc(postWriterId);
    
    await FirebaseFirestore.instance.collection('likes').add({
      "creator_user_id": postWriterReference,
      "liker_user_id"  : thisUserLikerReference,
      "post_id"        : postToLikeReference,
    });
    return true;
  }
}
