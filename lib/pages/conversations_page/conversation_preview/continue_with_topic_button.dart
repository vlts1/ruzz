import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/pages/conversations_page/conversation_preview/continue_with_topic_cupertino_button.dart';
import 'package:ruzz/pages/conversations_page/conversation_preview/continue_with_topic_material_button.dart';

class ContinueWithTopicButton extends StatelessWidget {
  ContinueWithTopicButton(this.onClick, {super.key});
  final void Function() onClick;
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? ContinueWithTopicCupertinoButton(onClick)
        : ContinueWithTopicMaterialButton(onClick);
  }
}
