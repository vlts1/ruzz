import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/colors/i_platform_color.dart';

class SecondaryTextColor implements IPlatformColor {
  final _textColor = const CupertinoDynamicColor.withBrightness(
    color: Color.fromARGB(255, 78, 78, 78),
    darkColor: Color.fromARGB(255, 150, 150, 150),
  );
  @override
  Color fromTheme(BuildContext context) {
    return CupertinoDynamicColor.resolve(_textColor, context);
  }
}
