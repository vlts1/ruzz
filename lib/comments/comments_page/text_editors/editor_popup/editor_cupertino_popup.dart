import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ruzz/comments/comments_page/text_editors/editor_popup/popup_editor_type_zone.dart';
import '../anonymous_comment_attempt_message.dart';

class EditorCupertinoPopup {
  final _anonymousCommentAttemptMessage = AnonymousCommentAttemptMessage();

  void display(BuildContext context, Future<void> Function(BuildContext context) post) {
    if (FirebaseAuth.instance.currentUser!.isAnonymous) {
      _anonymousCommentAttemptMessage.display(context);
      return;
    }
    showCupertinoModalPopup(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            PopupEditorTypeZone(postCommentCallback: post),
          ],
        );
      },
    );
  }
}
