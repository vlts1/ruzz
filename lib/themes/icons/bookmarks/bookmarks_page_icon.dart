import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:ruzz/themes/icons/bookmarks/android_bookmarks_page_icon.dart';
import 'package:ruzz/themes/icons/bookmarks/ios_bookmarks_page_icon.dart';

class BookmarksPageIcon extends StatelessWidget {
  const BookmarksPageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const IosBookmarksPageIcon()
        : const AndroidBookmarksPageIcon();
  }
}
