import 'package:flutter/material.dart';
import 'package:ruzz/themes/colors/i_platform_color.dart';

class UpdateTextHighlightColor implements IPlatformColor {
  @override
  Color fromTheme(BuildContext context) {
    return Colors.redAccent;
  }
}
