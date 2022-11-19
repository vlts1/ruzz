import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/local_db/release.dart';
import 'package:ruzz/providers/bookmarks.dart';
import 'package:ruzz/update_widgets/in_list_update/bookmark/bookmark_status_switcher.dart';
import 'package:ruzz/update_widgets/in_list_update/bookmark/icon/bookmark_update_button.dart';

class BookmarkUpdate extends StatefulWidget {
  const BookmarkUpdate({required this.release, Key? key}) : super(key: key);
  final Release release;
  @override
  State<BookmarkUpdate> createState() => _BookmarkUpdateState();
}

class _BookmarkUpdateState extends State<BookmarkUpdate> {
  late final bookmarkStatusSwitcher = BookmarkStatusSwitcher(widget.release);
  late Bookmarks bookmarksProvider;
  @override
  void didChangeDependencies() {
    bookmarksProvider = Provider.of<Bookmarks>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final isBookmarked = bookmarksProvider.bookmarks.contains(widget.release);

    return Platform.isIOS
      ? CupertinoButton(
          minSize: 0,
          padding: EdgeInsets.zero,
          onPressed: () { 
            bookmarkStatusSwitcher.switchBookmarkStatus(isBookmarked, context); 
          },
          child: BookmarkUpdateButton(isBookmarked: isBookmarked),
        )
      : TextButton(
          onPressed: () { 
            bookmarkStatusSwitcher.switchBookmarkStatus(isBookmarked, context); 
          },
          child: BookmarkUpdateButton(isBookmarked: isBookmarked),
        );
  }
}
