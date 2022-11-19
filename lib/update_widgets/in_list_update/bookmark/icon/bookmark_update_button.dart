import 'dart:io';
import 'package:flutter/material.dart';
import '../../../../themes/icons/add_bookmark/android_bookmark_icon.dart';
import '../../../../themes/icons/add_bookmark/i_bookmark_icon.dart';
import '../../../../themes/icons/add_bookmark/ios_bookmark_icon.dart';

class BookmarkUpdateButton extends StatelessWidget {
  BookmarkUpdateButton({required this.isBookmarked, Key? key})
      : super(key: key);

  final bool isBookmarked;
  final IBookmarkIcon iosIcon = IOSBookmarkIcon();
  final IBookmarkIcon androidIcon = AndroidBookmarkIcon();

  Icon _platformIcon(BuildContext context) {
    if (Platform.isIOS) {
      return iosIcon.getIconFromState(isBookmarked, context);
    }
    return androidIcon.getIconFromState(isBookmarked, context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8, left: 5, right: 5),
      child: _platformIcon(context),
    );
  }
}
