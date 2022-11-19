import 'package:flutter/cupertino.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/name_editor_text_field/maximum_name_length.dart';

class HugeNameMessage extends CupertinoAlertDialog {
  HugeNameMessage(this.context, {Key? key}) : super(key: key);
  final BuildContext context;
  final _maximumNameLength = MaximumNameLength();

  @override
  Widget? get title => const Text("Name is too long");

  @override
  Widget? get content => Text(
        "Name exceeds the limit of ${_maximumNameLength.maxLength} characters.",
      );

  @override
  List<Widget> get actions => <Widget>[
        CupertinoDialogAction(
          child: const Text("Ok"),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ];
}
