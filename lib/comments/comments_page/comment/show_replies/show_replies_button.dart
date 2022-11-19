import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/comment/show_replies/replies_button_visibility_modifier.dart';
import 'package:ruzz/providers/replies/replies_visibility.dart';

class ShowRepliesButton extends StatefulWidget {
  const ShowRepliesButton(this.commentId, {Key? key}) : super(key: key);
  final String commentId;
  @override
  State<ShowRepliesButton> createState() => _ShowRepliesButtonState();
}

class _ShowRepliesButtonState extends State<ShowRepliesButton> {
  late final visibilityModifier = RepliesButtonVisibilityModifier(context);
  late RepliesVisibility repliesVisibility;

  @override
  void didChangeDependencies() {
    repliesVisibility = Provider.of<RepliesVisibility>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final text = repliesVisibility.isVisible(widget.commentId)
        ? const Text("Hide")
        : const Text("Show Replies");
    return Platform.isIOS
        ? CupertinoButton(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: text,
            onPressed: () {
              visibilityModifier.switchRepliesVisibility(widget.commentId);
            },
          )
        : TextButton(
            onPressed: () {
              visibilityModifier.switchRepliesVisibility(widget.commentId);
            },
            child: text,
            style: TextButton.styleFrom(
              alignment: Alignment.centerLeft,
              padding:   EdgeInsets.zero,
            ),
          );
  }
}
