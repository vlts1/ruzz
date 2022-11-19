import 'package:cloud_firestore/cloud_firestore.dart';

class CommentLikedByUser {
  CommentLikedByUser(this.postPath, this.userId);
  final String userId;
  final String postPath;

  Future<bool> get isCommentLiked async {
    final postReference  = FirebaseFirestore.instance.doc(postPath);
    final likerReference = FirebaseFirestore.instance.collection('users').doc(userId);
    
    final likesByUser = await FirebaseFirestore.instance
        .collection('likes')
        .where('post_id',       isEqualTo: postReference)
        .where('liker_user_id', isEqualTo: likerReference)
        .limit(1)
        .get();

    if (likesByUser.docs.isEmpty) return false;
    return true;
  }
}
