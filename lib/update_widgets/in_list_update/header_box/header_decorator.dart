import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/themes/colors/divider_platform_color.dart';

class HeaderDecorator {
  BoxDecoration boxDecoration(BuildContext context) {
    final color = Platform.isAndroid ? Theme.of(context).bottomAppBarColor : CupertinoTheme.of(context).barBackgroundColor;
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(14),
      border: Border.fromBorderSide(
        BorderSide(
          color: DividerPlatformColor().fromTheme(context),
          width: 0.5,
        ),
      ),
    );
  }
}
