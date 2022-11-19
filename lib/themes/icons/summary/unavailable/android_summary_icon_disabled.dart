import 'package:flutter/material.dart';

import '../../../colors/disabled_button_color.dart';

class AndroidSummaryIconDisabled extends StatelessWidget {
  AndroidSummaryIconDisabled({super.key});
  final _disabledButtonColor = DisabledButtonColor();
  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.format_quote_sharp,
      color: _disabledButtonColor.fromTheme(context),
      size: 20,
    );
  }
}
