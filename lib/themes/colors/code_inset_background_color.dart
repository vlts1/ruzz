import 'package:flutter/cupertino.dart';
import 'i_platform_color.dart';

class CodeInsetBackgroundColor implements IPlatformColor {
  final Color _color = const CupertinoDynamicColor.withBrightness(
    color: Color.fromARGB(255, 245, 245, 245),
    darkColor: CupertinoColors.darkBackgroundGray,
  );

  @override
  Color fromTheme(context) {
    return CupertinoDynamicColor.resolve(_color, context);
  }
}
