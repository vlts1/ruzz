import 'package:cloud_firestore/cloud_firestore.dart';

class TechnologyTrackingRemover {
  Future<void> stopTrackingTechnology(String technology, String uID) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uID)
        .update({"my_technologies": FieldValue.arrayRemove([technology])});
  }
}