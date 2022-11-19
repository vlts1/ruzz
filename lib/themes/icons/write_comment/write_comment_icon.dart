import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ruzz/themes/icons/write_comment/android_write_comment_icon.dart';
import 'package:ruzz/themes/icons/write_comment/ios_write_comment_icon.dart';

class WriteCommentIcon extends StatelessWidget {
  const WriteCommentIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const IosWriteCommentIcon()
        : const AndroidWriteCommentIcon();
  }
}
