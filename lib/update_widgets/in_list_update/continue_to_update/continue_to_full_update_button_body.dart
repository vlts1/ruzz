import 'package:flutter/cupertino.dart';
import '../../../themes/colors/disabled_button_color.dart';
import '../../../themes/icons/release/available/release_icon.dart';
import '../../../themes/icons/release/unavailable/release_icon_disabled.dart';
import '../../../themes/system_text_size.dart';

class ContinueToFullUpdateButtonBody extends StatelessWidget {
  ContinueToFullUpdateButtonBody({this.isDisabled = false, super.key});
  final bool isDisabled;

  final _disabledColor = DisabledButtonColor();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isDisabled ? const ReleaseIconDisabled() : const ReleaseIcon(),
        Text(
          'Release',
          style: TextStyle(
            color: isDisabled ? _disabledColor.fromTheme(context) : null,
            fontSize: SystemTextSize.fromPlatform(context) + 1,
          ),
        ),
      ],
    );
  }
}
