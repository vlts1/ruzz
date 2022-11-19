import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_page/text_editors/comment_poster/comment_poster.dart';
import 'package:ruzz/themes/icons/write_comment/write_comment_icon.dart';
import 'editor_popup/editor_cupertino_popup.dart';
import 'editor_popup/editor_material_popup.dart';

class CommentEditor extends StatefulWidget {
  const CommentEditor({
    Key? key,
    required this.technology,
    required this.version,
  }) : super(key: key);

  final String technology;
  final String version;
  @override
  State<CommentEditor> createState() => _CommentEditorState();
}

class _CommentEditorState extends State<CommentEditor> {
  final editorCupertinoPopup = EditorCupertinoPopup();
  final editorMaterialPopup  = EditorMaterialPopup();

  late final commentPoster = CommentPoster(widget.technology, widget.version);
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            minSize: 0,
            padding: const EdgeInsets.only(left: 8, right: 15),
            onPressed: () {
              editorCupertinoPopup.display(context, commentPoster.post);
            },
            child: const WriteCommentIcon(),
          )
        : IconButton(
            onPressed: () {
              editorMaterialPopup.display(context, commentPoster.post);
            },
            icon: WriteCommentIcon(),
          );
  }
}
