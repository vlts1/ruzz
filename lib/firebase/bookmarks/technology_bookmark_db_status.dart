import 'package:cloud_firestore/cloud_firestore.dart';

class TechnologyBookmarkDbStatus {
  TechnologyBookmarkDbStatus(this.userId, this.technology, this.version);
  final String userId;
  final String technology;
  final String version;

  Future<bool> get isBookmarked async {
    final docSnap = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection("bookmarks")
        .where("technology", isEqualTo: technology)
        .where("version", isEqualTo: version)
        .limit(1)
        .get();

    if (docSnap.docs.isEmpty) return false;
    if (docSnap.docs.single.exists == false) return false;

    return true;
  }
}
