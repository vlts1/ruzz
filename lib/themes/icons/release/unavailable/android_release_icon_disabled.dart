import 'package:flutter/material.dart';

import '../../../colors/disabled_button_color.dart';

class AndroidReleaseIconDisabled extends StatelessWidget {
  AndroidReleaseIconDisabled({super.key});
  final _disabledColor = DisabledButtonColor();

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.article_outlined,
      size: 20,
      color: _disabledColor.fromTheme(context),
    );
  }
}
