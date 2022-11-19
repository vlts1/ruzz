import 'package:flutter/material.dart';
import 'i_platform_color.dart';

class DividerPlatformColor implements IPlatformColor {
  @override
  Color fromTheme(context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.light) {
      return Colors.grey.shade300;
    }
    return Colors.grey.shade800;
  }
}
