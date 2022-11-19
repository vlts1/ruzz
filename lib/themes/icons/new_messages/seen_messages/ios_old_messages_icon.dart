import 'package:flutter/cupertino.dart';

import '../../../colors/disabled_button_color.dart';

class IosOldMessagesIcon extends StatelessWidget {
  IosOldMessagesIcon({super.key});
  final _disabledColor = DisabledButtonColor();

  @override
  Widget build(BuildContext context) {
    return Icon(
      CupertinoIcons.envelope_open,
      size: 21,
      color: _disabledColor.fromTheme(context),
    );
  }
}
