import 'package:flutter/material.dart';
import 'package:ruzz/themes/colors/i_platform_color.dart';
import 'package:ruzz/themes/colors/secondary_text_color.dart';
import 'package:ruzz/themes/system_text_size.dart';

class ReceiverText extends StatelessWidget {
  ReceiverText(this.text, {Key? key}) : super(key: key);
  final String text;
  final IPlatformColor _textColor = SecondaryTextColor();
  @override
  Widget build(BuildContext context) {
    if (text == "") {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: Text(
        text,
        style: TextStyle(
          color: _textColor.fromTheme(context),
          fontSize: SystemTextSize.fromPlatform(context) - 2.5,
        ),
      ),
    );
  }
}
