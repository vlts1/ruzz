import 'package:cloud_firestore/cloud_firestore.dart';

class MyComments {
  MyComments(this.technology, this.version, this.myUserId);
  final String technology;
  final String version;
  final String myUserId;

  Future<QuerySnapshot> get myLatestComments async {
    final comments = await FirebaseFirestore.instance
        .collection('comments')
        .where("technology", isEqualTo: technology)
        .where("version",    isEqualTo: version)
        .where('user_id',    isEqualTo: "/users/$myUserId")
        .orderBy("date")
        .get();

    return comments;
  }
}
