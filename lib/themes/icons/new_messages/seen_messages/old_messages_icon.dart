import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ruzz/themes/icons/new_messages/seen_messages/android_old_messages_icon.dart';
import 'package:ruzz/themes/icons/new_messages/seen_messages/ios_old_messages_icon.dart';

class OldMessagesIcon extends StatelessWidget {
  const OldMessagesIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? IosOldMessagesIcon()
        : AndroidOldMessagesIcon();
  }
}
