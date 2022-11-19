import 'package:flutter/cupertino.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/error_messages/name_too_short_message.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/name_editor_text_field/minimum_name_length.dart';

class ShortInputErrorHandler {
  final _minimumNameLength = MinimumNameLength();

  bool didDisplayErrorMessage(String input, BuildContext context) {
    if (input.trim().length >= _minimumNameLength.minLength) return false;

    debugPrint('Length of the name is unacceptable');
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return NameTooShortMessage(context);
      },
    );
    return true;
  }
}
