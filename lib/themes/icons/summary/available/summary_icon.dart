import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'android_summary_icon.dart';
import 'ios_summary_icon.dart';

class SummaryIcon extends StatelessWidget {
  const SummaryIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? IosSummaryIcon() : AndroidSummaryIcon();
  }
}
