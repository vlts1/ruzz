import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/colors/i_platform_color.dart';
import 'package:ruzz/themes/colors/secondary_text_color.dart';

import '../../../themes/system_text_size.dart';

class OptionDescription extends StatelessWidget {
  OptionDescription(this.name, {Key? key}) : super(key: key);
  final String name;
  final IPlatformColor _secondaryColor = SecondaryTextColor();
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        color:     _secondaryColor.fromTheme(context),
        fontSize:   SystemTextSize.fromPlatform(context) - 3,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}
