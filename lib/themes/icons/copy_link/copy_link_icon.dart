import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:ruzz/themes/icons/copy_link/android_copy_link_icon.dart';
import 'package:ruzz/themes/icons/copy_link/ios_copy_link_icon.dart';

class CopyLinkIcon extends StatelessWidget {
  const CopyLinkIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const IosCopyLinkIcon()
        : const AndroidCopyLinkIcon();
  }
}
