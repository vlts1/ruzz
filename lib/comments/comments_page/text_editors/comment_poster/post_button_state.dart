import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostButtonState {
  final Row toBePostedState = Row(
    children: [
      Text("Post "),
      Icon(Platform.isIOS ? CupertinoIcons.pencil_circle : Icons.edit),
    ],
  );

  final Row disabledState = Row(
    children: [
      Text(
        "Post ",
        style: TextStyle(color: CupertinoColors.quaternarySystemFill),
      ),
      Icon(
        Platform.isIOS ? CupertinoIcons.pencil_circle : Icons.edit,
        color: CupertinoColors.quaternarySystemFill,
      ),
    ],
  );

  final Widget uploadingCommentState = const CupertinoActivityIndicator();
}
