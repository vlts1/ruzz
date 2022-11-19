import 'package:cloud_firestore/cloud_firestore.dart';

class CommentLikes {
  CommentLikes(this.postPath);
  final String postPath;

  Future<int> get likesCount async {
    final postReference = FirebaseFirestore.instance.doc(postPath);
    final likes = await FirebaseFirestore.instance
        .collection('likes')
        .where("post_id", isEqualTo: postReference)
        .get();

    return likes.docs.length;
  }
}
