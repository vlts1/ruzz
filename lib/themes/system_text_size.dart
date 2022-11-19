import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SystemTextSize {
  static double fromPlatform(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTheme.of(context).textTheme.textStyle.fontSize!;
    }
    return Theme.of(context).textTheme.bodyText2!.fontSize!;
  }
}
