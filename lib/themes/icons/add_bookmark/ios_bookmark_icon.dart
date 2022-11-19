import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/system_text_color.dart';
import 'i_bookmark_icon.dart';

class IOSBookmarkIcon implements IBookmarkIcon {
  @override
  Icon getIconFromState(bool isBookmarked, BuildContext context) {
    if (isBookmarked) {
      return const Icon(
        CupertinoIcons.bookmark_fill,
        color: CupertinoColors.activeBlue,
      );
    }
    return Icon(
      CupertinoIcons.bookmark,
      size: 24,
      color: SystemTextColor.getColor(context),
    );
  }
}
