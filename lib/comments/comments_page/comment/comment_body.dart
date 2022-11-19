import 'package:flutter/material.dart';
import '../../../themes/system_text_color.dart';

class CommentBody extends StatelessWidget {
  const CommentBody({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      style: TextStyle(height: 2, color: SystemTextColor.getColor(context)),
    );
  }
}
