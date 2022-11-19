import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_page/text_editors/comment_poster/post_button_state.dart';
import 'package:ruzz/comments/comments_page/text_editors/comment_poster/post_button_visibility.dart';
import '../../../../pages/no_internet_posting_message.dart';

class PostCommentButton extends StatefulWidget {
  const PostCommentButton({required this.postComment, Key? key}) : super(key: key);

  final Future<void> Function(BuildContext context) postComment;
  @override
  State<PostCommentButton> createState() => _PostCommentButtonState();
}

class _PostCommentButtonState extends State<PostCommentButton> {
  final postButtonState = PostButtonState();
  late Widget buttonEngraving;
  late String currentUserInfo;
  bool isUploading = false;

  Future<void> mutateButtonState(PostButtonVisibility buttonVisibility) async {
    if (buttonVisibility.fromPostContents() == false) return;
    setState(() { isUploading = true; });
    try {
      await widget.postComment(context).timeout(Duration(seconds: 5), onTimeout: () => throw Exception());
      Navigator.pop(context);
    } catch (e) {
      Navigator.pop(context);
      NoInternetPostingMessage().showMessage(context);
    }
    
    setState(() { 
      isUploading = false; 
      buttonEngraving = postButtonState.disabledState; 
    });
  }

  @override
  Widget build(BuildContext context) {
    final postButtonVisibility = PostButtonVisibility(context);
    buttonEngraving = postButtonState.toBePostedState;    
    if (postButtonVisibility.fromPostContents() == false) {
      buttonEngraving = postButtonState.disabledState;
    }
    if (isUploading) buttonEngraving = postButtonState.uploadingCommentState;
    
    return Platform.isIOS ? 
      CupertinoButton(
        minSize: 0,
        pressedOpacity: postButtonVisibility.fromPostContents() ? 0.4 : 1,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        onPressed: () { mutateButtonState(postButtonVisibility); },
        child: buttonEngraving,
      ) 
      : 
      TextButton(
        onPressed: () { mutateButtonState(postButtonVisibility); }, 
        child: buttonEngraving,
      );
  }
}