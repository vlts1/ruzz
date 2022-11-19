import 'package:flutter/material.dart';
import 'package:ruzz/themes/colors/divider_platform_color.dart';
import 'package:ruzz/themes/colors/i_platform_color.dart';

class OptionSeparator extends StatelessWidget {
  const OptionSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final IPlatformColor dividerColor = DividerPlatformColor();
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Divider(
        height:    0.8,
        thickness: 0.5,
        color: dividerColor.fromTheme(context),
      ),
    );
  }
}
