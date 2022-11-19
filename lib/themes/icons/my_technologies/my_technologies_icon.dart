import 'dart:io';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ruzz/themes/icons/my_technologies/android_my_technologies_icon.dart';
import 'package:ruzz/themes/icons/my_technologies/ios_my_technologies_icon.dart';

class MyTechnologiesIcon extends StatelessWidget {
  const MyTechnologiesIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const IosMyTechnologiesIcon()
        : const AndroidMyTechnologiesIcon();
  }
}
