import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/firebase/bookmarks/bookmarks_db_limiter.dart';
import 'package:ruzz/firebase/bookmarks/current_user_bookmarks_loader.dart';
import 'package:ruzz/firebase/bookmarks/technology_bookmark_db_remover.dart';
import 'package:ruzz/firebase/bookmarks/technology_db_bookmarker.dart';
import 'package:ruzz/local_db/release.dart';
import 'package:ruzz/providers/current_user_info.dart';

class Bookmarks extends ChangeNotifier {
  Bookmarks(this.context);
  final BuildContext context;
  final List<Release> _bookmarks = [];
  List<Release> get bookmarks => List.unmodifiable(_bookmarks);

  final _currentUserBookmarksLoader = CurrentUserBookmarksLoader();
  final _bookmarksDbLimiter = BookmarksDbLimiter();

  void removeBookmark(Release release) {
    final _bookmarkDBRemover = TechnologyBookmarkDBRemover(
      Provider.of<CurrentUserInfo>(context, listen: false).docId,
      release.technology,
      release.version,
    );

    _bookmarkDBRemover.removeBookmark();
    _bookmarks.remove(release);
    notifyListeners();

    debugPrint('removed bookmark for ${release.technology} ${release.version}');
  }

  void addBookmark(Release release) {
    if (_bookmarks.contains(release) == false) {
      TechnologyDbBookmarker(release, context).bookmark();
      _bookmarks.add(release);
      notifyListeners();

      debugPrint('added bookmark for ${release.technology} ${release.version}');
    }
  }

  Future<void> fetchBookmarks() async {
    final userBookmarks = await _currentUserBookmarksLoader.userBookmarks(
      context,
    );

    final allowedBookmarks = _bookmarksDbLimiter.restrictInfiniteBookmarks(
      userBookmarks,
    );

    final List<Release> fetchedBookmarks = [];
    for (final bookmark in allowedBookmarks) {
      fetchedBookmarks.add(Release.fromFirestore(bookmark.data()));
    }

    _bookmarks.clear();
    _bookmarks.addAll(fetchedBookmarks);

    notifyListeners();
  }
}
