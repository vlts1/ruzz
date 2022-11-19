import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_page/text_editors/posting_cancellation/posting_cancellation_cupertino_button.dart';
import '../../../../themes/colors/popup_background_color.dart';
import '../comment_poster/post_comment_button.dart';
import '../comment_text_field.dart';
import '../posting_cancellation/posting_cancellation_material_button.dart';
import '../unsupported_input_description.dart';

class PopupEditorTypeZone extends StatelessWidget {
  PopupEditorTypeZone({required this.postCommentCallback, super.key});
  final Future<void> Function(BuildContext) postCommentCallback;
  final backgroundColor = PopupBackgroundColor();
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor.fromTheme(context),
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Platform.isIOS
                  ? PostingCancellationCupertinoButton()
                  : const PostingCancellationMaterialButton(),
              PostCommentButton(postComment: postCommentCallback),
            ],
          ),
          const SizedBox(height: 12),
          const CommentTextField(),
          SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          const SizedBox(height: 15),
          const UnsupportedInputDescription(),
          const SizedBox(height: 35),
        ],
      ),
    );
  }
}
