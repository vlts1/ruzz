import 'package:flutter/cupertino.dart';

class SectionBackgroundColor {
  Color backgroundColor(bool isSelected) {
    if (isSelected) {
      return CupertinoColors.activeBlue;
    }
    return CupertinoColors.systemGrey5;
  }
}
