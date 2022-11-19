import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/colors/i_platform_color.dart';

class FollowableTechnologyColor implements IPlatformColor {
  @override
  Color fromTheme(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;
    // For some reason CupertinoDynamicColor.withBrightness() doesn't work 
    // in this case.
    final Color color = isDarkMode 
        ? CupertinoColors.systemGrey5 
        : CupertinoColors.systemGrey6;
    return CupertinoDynamicColor.resolve(color, context);
  }
}
