import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ruzz/themes/colors/secondary_text_color.dart';
import 'package:ruzz/themes/system_text_size.dart';

class FriendlyNoConversationsMessage extends StatelessWidget {
  const FriendlyNoConversationsMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: Platform.isIOS
            ? const EdgeInsets.only(bottom: 17)
            : EdgeInsets.only(bottom: kToolbarHeight + 17),
        child: Text(
          'Your conversations will appear here',
          style: TextStyle(
            color: SecondaryTextColor().fromTheme(context),
            fontSize: SystemTextSize.fromPlatform(context) - 1,
          ),
        ),
      ),
    );
  }
}
