import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/icons/arrow/android_arrow_icon.dart';
import 'package:ruzz/themes/icons/arrow/ios_arrow_icon.dart';

class ChevronArrowIcon extends StatelessWidget {
  const ChevronArrowIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? IosArrowIcon() : AndroidArrowIcon();
  }
}
