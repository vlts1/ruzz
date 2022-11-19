import 'dart:io';

import 'package:flutter/src/widgets/framework.dart';
import 'package:ruzz/themes/icons/release/unavailable/android_release_icon_disabled.dart';
import 'package:ruzz/themes/icons/release/unavailable/ios_release_icon_disabled.dart';

class ReleaseIconDisabled extends StatelessWidget {
  const ReleaseIconDisabled({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? IosReleaseIconDisabled()
        : AndroidReleaseIconDisabled();
  }
}
