import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:ruzz/pages/home_page/updates_page/app_bar/new_page_navigation_button_android.dart';

class NewPageNavigationButton extends StatelessWidget {
  const NewPageNavigationButton({
    required this.destination,
    required this.icon,
    Key? key,
  }) : super(key: key);
  
  final String destination;
  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            minSize: 12,
            padding: const EdgeInsets.all(0),
            child: icon,
            onPressed: () {
              Navigator.pushNamed(context, destination);
            },
          )
        : NewPageNavigationButtonAndroid(
            destination: destination,
            icon: icon,
          );
  }
}
