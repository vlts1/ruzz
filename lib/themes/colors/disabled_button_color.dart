import 'package:ruzz/themes/colors/i_platform_color.dart';
import 'package:flutter/cupertino.dart';

class DisabledButtonColor implements IPlatformColor {
  @override
  Color fromTheme(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.light) {
      return const Color.fromARGB(210, 187, 222, 251);
    }
    return const Color.fromARGB(80, 187, 222, 251);
  }
}
