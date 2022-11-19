import 'package:flutter/cupertino.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/error_messages/huge_name_message.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/name_editor_text_field/maximum_name_length.dart';

class HugeInputErrorHandler {
  final _maximumNameLength = MaximumNameLength();

  bool didDisplayErrorMessage(String input, BuildContext context) {
    if (input.trim().length <= _maximumNameLength.maxLength) return false;

    debugPrint('Length of the name is unacceptable');
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return HugeNameMessage(context);
      },
    );
    return true;
  }
}
