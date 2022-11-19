import 'package:flutter/cupertino.dart';

import '../name_editor_text_field/minimum_name_length.dart';

class NameTooShortMessage extends CupertinoAlertDialog {
  NameTooShortMessage(this.context, {Key? key}) : super(key: key);
  final BuildContext context;
  final _minimumNameLength = MinimumNameLength();

  @override
  Widget? get title => const Text("Name is too short");

  @override
  Widget? get content => Text(
        "Name must include at least ${_minimumNameLength.minLength} characters.",
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
