import 'package:flutter/material.dart';
import '../../../themes/colors/divider_platform_color.dart';
import '../../../themes/colors/i_platform_color.dart';

class NamedDivider extends StatelessWidget {
  const NamedDivider({required this.name, Key? key}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    final IPlatformColor dividerPlatformColor = DividerPlatformColor();
    return Container(
      margin: const EdgeInsets.only(top: 28, bottom: 28),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Divider(
              indent: 0,
              endIndent: 16,
              thickness: 2,
              color: dividerPlatformColor.fromTheme(context),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 15,
              color:
                  MediaQuery.of(context).platformBrightness == Brightness.light
                      ? Colors.black
                      : Colors.grey.shade400,
            ),
          ),
          Expanded(
            child: Divider(
              indent: 16,
              endIndent: 0,
              thickness: 2,
              color: dividerPlatformColor.fromTheme(context),
            ),
          ),
        ],
      ),
    );
  }
}
