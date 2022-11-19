import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'i_platform_color.dart';

class FragmentTextColor implements IPlatformColor {
  final textColor = CupertinoDynamicColor.withBrightness(
    color: Colors.black,
    darkColor: Colors.grey.shade300,
  );

  @override
  Color fromTheme(context) {
    return CupertinoDynamicColor.resolve(textColor, context);
  }
}
