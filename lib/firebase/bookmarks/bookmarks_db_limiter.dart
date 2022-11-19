import 'package:cloud_firestore/cloud_firestore.dart';

class BookmarksDbLimiter {
  static const int _maxBookmarksAllowed = 35;

  List<QueryDocumentSnapshot<Map<String, dynamic>>> restrictInfiniteBookmarks(
    QuerySnapshot<Map<String, dynamic>> bookmarks,
  ) {
    late List<QueryDocumentSnapshot<Map<String, dynamic>>> restrictedBookmarks;
    if (bookmarks.docs.length > _maxBookmarksAllowed) {
      final extraBookmarks = bookmarks.docs.sublist(_maxBookmarksAllowed + 1);
      for (final doc in extraBookmarks) {
        FirebaseFirestore.instance.runTransaction((transaction) async {
          transaction.delete(doc.reference);
        });
      }

      restrictedBookmarks = bookmarks.docs.sublist(0, _maxBookmarksAllowed + 1);
    } else {
      restrictedBookmarks = bookmarks.docs;
    }
    return restrictedBookmarks;
  }
}
