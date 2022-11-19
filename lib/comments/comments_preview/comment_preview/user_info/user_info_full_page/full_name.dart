import 'package:flutter/material.dart';
import 'package:ruzz/themes/system_text_color.dart';
import 'package:ruzz/themes/system_text_size.dart';

class FullName extends StatelessWidget {
  const FullName({required this.name, Key? key}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        color: SystemTextColor.getColor(context),
        fontSize: SystemTextSize.fromPlatform(context) + 4,
      ),
    );
  }
}
