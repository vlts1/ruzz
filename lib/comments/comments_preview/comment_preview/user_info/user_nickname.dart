import 'package:flutter/material.dart';
import 'package:ruzz/themes/system_text_color.dart';
import 'package:ruzz/themes/system_text_size.dart';

class UserNickname extends StatelessWidget {
  const UserNickname({required this.nickname, Key? key}) : super(key: key);
  final String nickname;

  @override
  Widget build(BuildContext context) {
    return Text(
      nickname,
      style: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: SystemTextSize.fromPlatform(context) - 2,
        color: SystemTextColor.getColor(context),
      ),
    );
  }
}
