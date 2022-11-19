import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/icons/subscribe/unsubscribe_from_technology/android_unsubscribe_icon.dart';
import 'package:ruzz/themes/icons/subscribe/unsubscribe_from_technology/ios_unsubscribe_icon.dart';

class UnsubscribeIcon extends StatelessWidget {
  const UnsubscribeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const IosUnsubscribeIcon()
        : const AndroidUnsubscribeIcon();
  }
}
