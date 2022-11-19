import 'package:cloud_firestore/cloud_firestore.dart';

class TechnologyTracker {
  Future<void> trackTechnology(String technology, String uID) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uID)
        .update({"my_technologies": FieldValue.arrayUnion([technology])});
  }
}