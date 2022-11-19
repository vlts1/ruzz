import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:ruzz/themes/icons/comment/android_comment_icon.dart';
import 'package:ruzz/themes/icons/comment/ios_comment_icon.dart';

class CommentIcon extends StatelessWidget {
  const CommentIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? const IosCommentIcon() : const AndroidCommentIcon();
  }
}
