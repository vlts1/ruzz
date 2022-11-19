import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_page/text_editors/editor_popup/popup_editor_type_zone.dart';
import '../anonymous_comment_attempt_message.dart';

class EditorMaterialPopup {
  final _anonymousCommentAttemptMessage = AnonymousCommentAttemptMessage();

  void display(BuildContext context, Future<void> Function(BuildContext context) post) {
    if (FirebaseAuth.instance.currentUser!.isAnonymous) {
      _anonymousCommentAttemptMessage.display(context);
      return;
    }
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Container(
          color: Color.fromARGB(0, 0, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [
              Spacer(),
              PopupEditorTypeZone(postCommentCallback: post),
            ],
          ),
        );
      },
    );
  }
}
