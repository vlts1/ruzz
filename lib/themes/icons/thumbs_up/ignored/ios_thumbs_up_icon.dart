import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/themes/system_text_color.dart';

class IosThumbsUpIcon extends StatelessWidget {
  const IosThumbsUpIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Platform.isIOS ? CupertinoIcons.hand_thumbsup : Icons.thumb_up_outlined,
      color: SystemTextColor.getColor(context),
    );
  }
}
