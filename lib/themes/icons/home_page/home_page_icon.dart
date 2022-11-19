import 'dart:io';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ruzz/themes/icons/home_page/android_home_page_icon.dart';
import 'package:ruzz/themes/icons/home_page/ios_home_page_icon.dart';

class HomePageIcon extends StatelessWidget {
  const HomePageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const IosHomePageIcon()
        : const AndroidHomePageIcon();
  }
}
