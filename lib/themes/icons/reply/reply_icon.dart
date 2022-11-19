import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:ruzz/themes/icons/reply/android_reply_icon.dart';
import 'package:ruzz/themes/icons/reply/ios_reply_icon.dart';

class ReplyIcon extends StatelessWidget {
  const ReplyIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? const IosReplyIcon() : const AndroidReplyIcon();
  }
}
