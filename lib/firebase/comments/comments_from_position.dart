import 'package:cloud_firestore/cloud_firestore.dart';

class CommentsFromPosition {
  CommentsFromPosition(this.technology, this.version);
  final String technology;
  final String version;

  Future<QuerySnapshot> getAfter(DocumentSnapshot doc, {int limit = 10}) async {
    assert(limit > 0);

    final sortedTopComments = await FirebaseFirestore.instance
        .collection('comments')
        .where("technology", isEqualTo: technology)
        .where("version", isEqualTo: version)
        .orderBy("date")
        .limit(limit)
        .startAfterDocument(doc)
        .get();

    return sortedTopComments;
  }
}
