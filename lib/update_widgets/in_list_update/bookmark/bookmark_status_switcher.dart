import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/providers/bookmarks.dart';
import 'package:ruzz/update_widgets/in_list_update/bookmark/anonymous_bookmark_attempt_message.dart';

import '../../../local_db/release.dart';

class BookmarkStatusSwitcher {
  BookmarkStatusSwitcher(this.release);
  final Release release;
  final _anonymousBookmarkAttemptMessage = AnonymousBookmarkAttemptMessage();

  void switchBookmarkStatus(bool isBookmarked, BuildContext context) {
    if (FirebaseAuth.instance.currentUser!.isAnonymous) {
      _anonymousBookmarkAttemptMessage.display(context);
      return;
    }

    final bookmarksProvider = Provider.of<Bookmarks>(context, listen: false);

    HapticFeedback.mediumImpact();
    if (isBookmarked) {
      bookmarksProvider.removeBookmark(release);
    } 
    else if (isBookmarked == false) {
      bookmarksProvider.addBookmark(release);
    }
  }
}
