import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'i_platform_color.dart';

class TextIndicatorColor extends CupertinoDynamicColor implements IPlatformColor {
  const TextIndicatorColor()
      : super.withBrightness(
          color: Colors.black54,
          darkColor: const Color.fromARGB(255, 166, 166, 166),
        );

  @override
  Color fromTheme(BuildContext context) {
    return CupertinoDynamicColor.resolve(this, context);
  }
}
