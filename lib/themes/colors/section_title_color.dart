import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/system_text_color.dart';

class SectionTitleColor {
  SectionTitleColor(this.context);
  final BuildContext context;

  Color textColor(bool isSelected) {
    if (isSelected) {
      return CupertinoColors.white;
    }
    return SystemTextColor.getColor(context);
  }
}