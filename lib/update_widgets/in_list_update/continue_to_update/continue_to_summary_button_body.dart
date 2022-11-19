import 'package:flutter/cupertino.dart';

import '../../../themes/colors/disabled_button_color.dart';
import '../../../themes/icons/summary/available/summary_icon.dart';
import '../../../themes/icons/summary/unavailable/summary_icon_disabled.dart';
import '../../../themes/system_text_size.dart';

class ContinueToSummaryButtonBody extends StatelessWidget {
  ContinueToSummaryButtonBody({super.key, this.isDisabled = false});
  final bool isDisabled;
  final _disabledColor = DisabledButtonColor();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isDisabled ? const SummaryIconDisabled() : const SummaryIcon(),
        Text(
          'Summary',
          style: TextStyle(
            color: isDisabled ? _disabledColor.fromTheme(context) : null,
            fontSize: SystemTextSize.fromPlatform(context) + 1,
          ),
        ),
      ],
    );
  }
}
