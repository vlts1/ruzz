import 'dart:io';
import 'package:flutter/material.dart';

import 'android_release_icon.dart';
import 'ios_release_icon.dart';

class ReleaseIcon extends StatelessWidget {
  const ReleaseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? IosReleaseIcon() : AndroidReleaseIcon();
  }
}
