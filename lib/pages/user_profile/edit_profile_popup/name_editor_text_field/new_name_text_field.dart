import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/name_editor_text_field/underline_decoration.dart';
import 'package:ruzz/providers/current_user_info.dart';
import 'package:ruzz/providers/editing_profile.dart';

class NewNameTextField extends StatefulWidget {
  const NewNameTextField({Key? key}) : super(key: key);

  @override
  State<NewNameTextField> createState() => _NewNameTextFieldState();
}

class _NewNameTextFieldState extends State<NewNameTextField> {
  final textFieldBottomPadding = 6.0;

  late final TextEditingController textEditingController;
  late final CurrentUserInfo       userInfoProvider;
  late       EditingProfile        profileEditorProvider;
  @override
  void initState() {
    userInfoProvider      = Provider.of<CurrentUserInfo>(context, listen: false);
    textEditingController = TextEditingController(text: userInfoProvider.fullName);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    profileEditorProvider = Provider.of<EditingProfile>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ?
      CupertinoTextField(
        onChanged: (String text) {
          profileEditorProvider.userName = text;
          print("text field name: " + text);
        },
        controller: textEditingController,
        decoration: UnderlineDecoration(),
        padding: EdgeInsets.only(bottom: textFieldBottomPadding),
        suffix: CupertinoButton(
          padding: EdgeInsets.only(right: 5, bottom: textFieldBottomPadding),
          minSize: 0,
          // TODO change icon for android
          child: Icon(
            Platform.isIOS ? CupertinoIcons.arrow_counterclockwise_circle_fill : Icons.arrow_circle_left_outlined,
            color: CupertinoColors.systemGrey3,
          ),
          onPressed: () {
            textEditingController.text     = userInfoProvider.fullName;
            profileEditorProvider.userName = userInfoProvider.fullName;
          },
        ),
      ) :
    TextField(
      onChanged: (String text) {
        profileEditorProvider.userName = text;
      },
      controller: textEditingController,
    );
  }
}