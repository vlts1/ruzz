import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/firebase/bookmarks/technology_bookmark_db_status.dart';
import 'package:ruzz/local_db/release.dart';
import 'package:ruzz/local_db/ruzz_db_date_to_date_time_adapter.dart';
import 'package:ruzz/providers/current_user_info.dart';

class TechnologyDbBookmarker {
  TechnologyDbBookmarker(this.release, this.context);
  final Release release;
  final BuildContext context;

  late final _currentUserInfo =Provider.of<CurrentUserInfo>(context, listen: false);

  late final _technologyBookmarkStatus = TechnologyBookmarkDbStatus(
    _currentUserInfo.docId,
    release.technology,
    release.version,
  );

  Future<void> bookmark() async {
    if (await _technologyBookmarkStatus.isBookmarked == true) {
      debugPrint("TechnologyBookmarker: bookmark already exists");
      return;
    }

    final userBookmarksReference = FirebaseFirestore.instance
        .collection('users')
        .doc(_currentUserInfo.docId)
        .collection("bookmarks");

    final technologyUserBookmark = await userBookmarksReference
        .where("technology", isEqualTo: release.technology)
        .where("version", isEqualTo: release.version)
        .limit(1)
        .get();

    if (technologyUserBookmark.docs.isEmpty) {
      final releaseDate = RuzzDbDateToDateTimeAdapter(release.releaseDate);
      await userBookmarksReference.add({
        "bookmarked_on" : Timestamp.now(),
        "technology"    : release.technology,
        "version"       : release.version,
        "date"          : Timestamp.fromDate(releaseDate),
        "docs_source"   : release.docsLink,
        "summary_source": release.summaryLink,
      });
    }
  }
}
