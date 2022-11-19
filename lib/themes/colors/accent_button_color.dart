import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/colors/i_platform_color.dart';

class AccentButtonColor implements IPlatformColor {
  @override
  Color fromTheme(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.light) {
      return const Color.fromARGB(255, 233, 239, 255);
    }
    return Color.fromARGB(255, 39, 41, 53);
  }
}
