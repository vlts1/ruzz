import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/colors/i_platform_color.dart';

class PopupBackgroundColor implements IPlatformColor {
  final _color = const CupertinoDynamicColor.withBrightness(
    color: CupertinoColors.lightBackgroundGray,
    darkColor: CupertinoColors.darkBackgroundGray,
  );

  @override
  Color fromTheme(BuildContext context) {
    return CupertinoDynamicColor.resolve(_color, context);
  }
}
