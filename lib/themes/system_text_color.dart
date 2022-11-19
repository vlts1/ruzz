import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SystemTextColor {
  static Color getColor(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTheme.of(context).textTheme.textStyle.color!;
    }
    return Theme.of(context).textTheme.bodyText2!.color!;
  }
}
