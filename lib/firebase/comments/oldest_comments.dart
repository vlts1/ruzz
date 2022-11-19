import 'package:cloud_firestore/cloud_firestore.dart';

class OldestComments {
  OldestComments(this.technology, this.version);
  final String technology;
  final String version;

  Future<QuerySnapshot> get top10 async {
    final comments = await FirebaseFirestore.instance
        .collection('comments')
        .where("technology", isEqualTo: technology)
        .where("version",    isEqualTo: version)
        .orderBy("date")
        .limit(10)
        .get();

    return comments;
  }
}
