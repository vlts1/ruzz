
import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/colors/i_platform_color.dart';

class PageBackgroundColor implements IPlatformColor {
  @override
  Color fromTheme(BuildContext context) {
    return CupertinoDynamicColor.resolve(CupertinoColors.systemBackground, context);
  } 
}