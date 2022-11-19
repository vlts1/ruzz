import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ruzz/themes/icons/new_messages/unseen_messages/android_unseen_messages_icon.dart';
import 'package:ruzz/themes/icons/new_messages/unseen_messages/ios_unseen_messages_icon.dart';

class UnseenMessagesIcon extends StatelessWidget {
  const UnseenMessagesIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const IosUnseenMessagesIcon()
        : const AndroidUnseenMessagesIcon();
  }
}
