import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/colors/secondary_text_color.dart';
import 'package:ruzz/themes/icons/subscribe/unsubscribe_from_technology/unsubscrube_icon.dart';

class UnsubscribeIconAlternative extends StatelessWidget {
  const UnsubscribeIconAlternative({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Text(
            'Subscribed',
            style: TextStyle(
              color: SecondaryTextColor().fromTheme(context), 
              fontSize: 16,
            ),
          )
        : UnsubscribeIcon();
  }
}