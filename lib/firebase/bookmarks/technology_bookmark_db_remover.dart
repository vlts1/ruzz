import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:ruzz/firebase/bookmarks/technology_bookmark_db_status.dart';

class TechnologyBookmarkDBRemover {
  TechnologyBookmarkDBRemover(this.userId, this.technology, this.version);
  final String userId;
  final String technology;
  final String version;

  late final technologyBookmarkStatus = TechnologyBookmarkDbStatus(
    userId,
    technology,
    version,
  );

  Future<bool> removeBookmark() async {
    if (await technologyBookmarkStatus.isBookmarked == false) {
      debugPrint("TechnologyBookmarkRemover: bookmark was not found");
      return false;
    }

    final technologyUserBookmark = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection("bookmarks")
        .where("technology", isEqualTo: technology)
        .where("version",    isEqualTo: version)
        .limit(1)
        .get();

    if (technologyUserBookmark.docs.isNotEmpty) {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        transaction.delete(technologyUserBookmark.docs.single.reference);
      });
      return true;
    }
    return false;
  }
}
