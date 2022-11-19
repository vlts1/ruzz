
import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/system_text_size.dart';
import 'i_header_text_style.dart';

class VersionNumberTextStyle implements IHeaderTextStyle {
  @override
  TextStyle getStyle(BuildContext context) {
    return TextStyle(
      color: CupertinoColors.systemGrey,
      fontSize: SystemTextSize.fromPlatform(context) - 1,
      fontWeight: FontWeight.normal,
    );
  }
}
