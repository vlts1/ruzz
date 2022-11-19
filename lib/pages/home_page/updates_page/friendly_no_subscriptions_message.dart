import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/themes/colors/secondary_text_color.dart';
import 'package:ruzz/themes/system_text_size.dart';

class FriendlyNoSubscriptionsMessage extends StatelessWidget {
  const FriendlyNoSubscriptionsMessage({super.key});

  @override
  Widget build(BuildContext context) {
    /// List view is needed for refresh indicator to work
    return ListView(
      padding: Platform.isIOS
          ? EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.1)
          : EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.8),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Platform.isIOS ? CupertinoIcons.search : Icons.search),
            SizedBox(width: 8),
            Text(
              'Open search to view technologies',
              style: TextStyle(
                color: SecondaryTextColor().fromTheme(context),
                fontSize: SystemTextSize.fromPlatform(context) - 1,
              ),
            ),
          ],
        ),
      ],
    );
  }
}