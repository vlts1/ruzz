import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_page/comment/comment_padding.dart';
import 'package:ruzz/themes/system_text_color.dart';

class CommentSeparator extends StatelessWidget {
  CommentSeparator({Key? key}) : super(key: key);

  final _commentPadding = CommentPadding();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left:   _commentPadding.edgeInsets.left,
        right:  _commentPadding.edgeInsets.right,
        top:    _commentPadding.edgeInsets.top + 5,
        bottom: _commentPadding.edgeInsets.top,
      ),
      child: Divider(
        height: 0.8,
        color: Platform.isIOS ?Color.fromARGB(255, 226, 226, 226) : SystemTextColor.getColor(context),
      ),
    );
  }
}
