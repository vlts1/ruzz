import 'package:flutter/cupertino.dart';

import 'package:ruzz/themes/colors/i_platform_color.dart';

class ToastColor implements IPlatformColor {
  @override
  Color fromTheme(BuildContext context) {
    if (MediaQuery.of(context).platformBrightness == Brightness.light) {
      return const Color.fromARGB(220, 242, 242, 242);
    }
    else {
      return Color.fromARGB(220, 52, 52, 52);
    }
  }
}
