import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExitIcon extends StatelessWidget {
  const ExitIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid
        ? Icon(
            Icons.exit_to_app_rounded,
            color: MediaQuery.of(context).platformBrightness == Brightness.light
                ? CupertinoColors.systemGrey2
                : CupertinoColors.systemGrey,
          )
        : Icon(
            Icons.exit_to_app_rounded,
            color: CupertinoColors.systemBlue,
          );
  }
}
