import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../themes/colors/secondary_text_color.dart';
import '../../../themes/system_text_size.dart';

class FullPageConversationScaffold extends StatelessWidget {
  FullPageConversationScaffold({
    required this.body,
    required this.technology,
    required this.version,
    super.key,
  });
  final Widget body;
  final String technology;
  final String version;

  String get _technologySource => 'From ${technology} ${version}';
  final _secondaryTextColor = SecondaryTextColor();
  @override
  Widget build(BuildContext context) {
    final title = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Conversation'),
        Text(
          _technologySource,
          style: TextStyle(
            color:   _secondaryTextColor.fromTheme(context),
            fontSize: SystemTextSize.fromPlatform(context) - 4,
          ),
        ),
      ],
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: title,
              previousPageTitle: 'More',
            ),
            child: body,
          )
        : Scaffold(appBar: AppBar(title: title, centerTitle: true), body: body);
  }
}
