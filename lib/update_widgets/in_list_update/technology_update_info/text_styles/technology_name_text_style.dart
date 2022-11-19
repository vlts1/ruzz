import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/system_text_color.dart';
import 'package:ruzz/themes/system_text_size.dart';
import 'i_header_text_style.dart';

class TechnologyNameTextStyle implements IHeaderTextStyle {
  @override
  TextStyle getStyle(BuildContext context) {
    return TextStyle(
      fontSize: SystemTextSize.fromPlatform(context) + 1,
      fontWeight: FontWeight.w500,
      color: SystemTextColor.getColor(context),
    );
  }
}
