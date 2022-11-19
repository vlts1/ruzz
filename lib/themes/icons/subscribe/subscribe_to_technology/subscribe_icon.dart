import 'dart:io';
import 'package:flutter/src/widgets/framework.dart';
import 'android_subscribe_icon.dart';
import 'ios_subscribe_icon.dart';

class SubscribeIcon extends StatelessWidget {
  const SubscribeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const IosSubscribeIcon()
        : const AndroidSubscribeIcon();
  }
}
