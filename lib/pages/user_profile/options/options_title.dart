import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/system_text_color.dart';

import '../../../themes/system_text_size.dart';

class OptionsTitle extends StatelessWidget {
  const OptionsTitle({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      "Account Settings",
      style: TextStyle(
        color:      SystemTextColor.getColor(context),
        fontWeight: FontWeight.w600,
        fontSize:   SystemTextSize.fromPlatform(context),
      ),
    );
  }
}
