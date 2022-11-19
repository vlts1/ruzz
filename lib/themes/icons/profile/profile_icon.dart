import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/icons/profile/android_profile_icon.dart';
import 'package:ruzz/themes/icons/profile/ios_profile_icon.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? const IosProfileIcon() : const AndroidProfileIcon();
  }
}
