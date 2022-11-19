import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'android_thumbs_up_icon.dart';
import 'ios_thumbs_up_icon.dart';

class ThumbsUpIcon extends StatelessWidget {
  const ThumbsUpIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const IosThumbsUpIcon()
        : const AndroidThumbsUpIcon();
  }
}
