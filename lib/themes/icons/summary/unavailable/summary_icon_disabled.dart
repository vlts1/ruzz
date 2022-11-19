import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/icons/summary/unavailable/android_summary_icon_disabled.dart';
import 'ios_summary_icon_disabled.dart';

class SummaryIconDisabled extends StatelessWidget {
  const SummaryIconDisabled({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? IosSummaryIconDisabled()
        : AndroidSummaryIconDisabled();
  }
}
