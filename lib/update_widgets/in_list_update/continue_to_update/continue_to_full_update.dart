import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/update_widgets/full_page_update/full_page_update.dart';
import 'package:ruzz/update_widgets/in_list_update/continue_to_update/continue_to_full_update_button_body.dart';

class ContinueToFullUpdate extends StatelessWidget {
  ContinueToFullUpdate(this.technology, this.version,
      {Key? key, required this.link})
      : super(key: key);
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
        : null;
    return Platform.isIOS
        ? CupertinoButton(
            minSize: 0,
            padding: EdgeInsets.zero,
            onPressed: onPressed,
            child: ContinueToFullUpdateButtonBody(isDisabled: link.isEmpty),
          )
        : TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(padding: EdgeInsets.all(8)),
            child: ContinueToFullUpdateButtonBody(isDisabled: link.isEmpty),
          );
  }
}
