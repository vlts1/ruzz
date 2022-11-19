import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../colors/disabled_button_color.dart';

class IosReleaseIconDisabled extends StatelessWidget {
  IosReleaseIconDisabled({super.key});
  final _disabledColor = DisabledButtonColor();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'images/ios-update-icon.svg',
      width: 20,
      height: 20,
      color: _disabledColor.fromTheme(context),
    );
  }
}
