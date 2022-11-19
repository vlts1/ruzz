import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/text_editors/max_allowed_comment_length.dart';
import 'package:ruzz/providers/editing_comment.dart';

class PostButtonVisibility {
  PostButtonVisibility(this.context);
  final BuildContext context;
  final _maxLength = MaxAllowedCommentLength();
  late final comment = Provider.of<EditingComment>(context).comment;

  bool fromPostContents() {
    if (comment.trim() == "") {
      return false;
    }
    if (comment.length > _maxLength.charLimit) {
      return false;
    }
    else {
      return true;
    }
  }
}
