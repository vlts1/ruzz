import 'package:flutter/cupertino.dart';

import '../../../colors/disabled_button_color.dart';

class IosSummaryIconDisabled extends StatelessWidget {
  IosSummaryIconDisabled({super.key});
  final _disabledButtonColor = DisabledButtonColor();

  @override
  Widget build(BuildContext context) {
    return Icon(
      CupertinoIcons.quote_bubble,
      color: _disabledButtonColor.fromTheme(context),
      size: 20,
    );
  }
}
