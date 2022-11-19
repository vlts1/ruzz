import 'package:flutter/material.dart';
import 'package:ruzz/themes/system_text_color.dart';
import 'i_bookmark_icon.dart';

class AndroidBookmarkIcon implements IBookmarkIcon {
  @override
  Icon getIconFromState(bool isBookmarked, BuildContext context) {
    if (isBookmarked) {
      return const Icon(Icons.bookmark, color: Colors.redAccent);
    }
    return Icon(Icons.bookmark_outline, color: SystemTextColor.getColor(context));
  }
}
