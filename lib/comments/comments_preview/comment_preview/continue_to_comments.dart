import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/continue_to_comments_button_body.dart';

class ContinueToComments extends StatelessWidget {
  const ContinueToComments({required this.openComments, Key? key})
      : super(key: key);
  final void Function() openComments;

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            padding: EdgeInsets.zero,
            minSize: 0,
            onPressed: openComments,
            child: ContinueToCommentsButtonBody(),
          )
        : TextButton(
            onPressed: openComments,
            child: ContinueToCommentsButtonBody(),
            style: TextButton.styleFrom(padding: EdgeInsets.all(8)),
          );
  }
}
