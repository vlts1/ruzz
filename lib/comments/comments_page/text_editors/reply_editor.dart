import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_page/text_editors/comment_poster/reply_poster.dart';
import 'package:ruzz/comments/comments_page/text_editors/editor_popup/editor_cupertino_popup.dart';
import 'package:ruzz/comments/comments_page/text_editors/editor_popup/editor_material_popup.dart';
import 'package:ruzz/themes/colors/popup_background_color.dart';
import 'package:ruzz/themes/icons/reply/reply_icon.dart';

class ReplyEditor extends StatefulWidget {
  const ReplyEditor({
    Key? key,
    required this.parentCommentId,
    required this.receiver,
    required this.receiverId,
  }) : super(key: key);

  final String parentCommentId;
  final String receiver;
  final String receiverId;
  @override
  State<ReplyEditor> createState() => _ReplyEditorState();
}

class _ReplyEditorState extends State<ReplyEditor> {
  final backgroundColor = PopupBackgroundColor();
  late final commentPoster = ReplyPoster(
    widget.parentCommentId,
    widget.receiver,
    widget.receiverId,
    context,
  );
  final editorCupertinoPopup = EditorCupertinoPopup();
  final editorMaterialPopup  = EditorMaterialPopup();
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: () {
              editorCupertinoPopup.display(context, commentPoster.post);
            },
            padding: const EdgeInsets.symmetric(vertical: 5),
            minSize: 0,
            child: Row(children: const [Text("Reply "), ReplyIcon()]),
          )
        : TextButton(
            onPressed: () {
              editorMaterialPopup.display(context, commentPoster.post);
            },
            style: TextButton.styleFrom(
              padding:       EdgeInsets.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              alignment:     Alignment.centerRight,
            ),
            child: Row(children: const [Text("Reply "), ReplyIcon()]),
          );
  }
}
