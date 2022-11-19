import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/update_widgets/full_page_update/full_page_update.dart';
import 'package:ruzz/update_widgets/in_list_update/continue_to_update/continue_to_summary_button_body.dart';

class ContinueToSummary extends StatelessWidget {
  ContinueToSummary(
    this.technology,
    this.version, {
    required this.link,
    Key? key,
  }) : super(key: key);
  final String technology;
  final String version;
  final String link;

  @override
  Widget build(BuildContext context) {
    final onPressed = link.isNotEmpty
        ? () {
            Navigator.pushNamed(
              context,
              FullPageUpdate.route,
              arguments: ['$technology $version', link],
            );
          }
        // Null makes the button look and act disabled
        : null;

    return Platform.isIOS
        ? CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: onPressed,
            child: ContinueToSummaryButtonBody(isDisabled: link.isEmpty),
          )
        : TextButton(
            onPressed: onPressed,
            child: ContinueToSummaryButtonBody(isDisabled: link.isEmpty),
            style: TextButton.styleFrom(padding: EdgeInsets.all(8)),
          );
  }
}
