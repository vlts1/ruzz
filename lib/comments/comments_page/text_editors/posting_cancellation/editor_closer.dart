import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/editing_comment.dart';

class EditorCloser {
  EditorCloser(this.context);
  final BuildContext context;
  void quitEditor() {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Provider.of<EditingComment>(context, listen: false).comment = "";
  }
}
