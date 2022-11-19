import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/done_button/done_button_background.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/done_button/user_info_saver.dart';
import 'package:ruzz/providers/current_user_info.dart';
import 'package:ruzz/providers/editing_profile.dart';

class ProfileEditingDoneButton extends StatefulWidget {
  const ProfileEditingDoneButton({Key? key}) : super(key: key);

  @override
  State<ProfileEditingDoneButton> createState() =>
      _ProfileEditingDoneButtonState();
}

class _ProfileEditingDoneButtonState extends State<ProfileEditingDoneButton> {
  late UserInfoSaver userInfoSaver;

  @override
  void didChangeDependencies() {
    final editingProfile = Provider.of<EditingProfile>(context, listen: true);
    final currentUserInfo = Provider.of<CurrentUserInfo>(context, listen: true);
    debugPrint('changed dependencies, new name: ' + editingProfile.userName);

    userInfoSaver = UserInfoSaver(
      context,
      editingProfile,
      currentUserInfo,
    );
    super.didChangeDependencies();
  }

  void saveInfo() {
    if (userInfoSaver.saveEditedInfo()) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            padding: EdgeInsets.zero,
            child: DoneButtonBackground(),
            onPressed: saveInfo,
          )
        : TextButton(onPressed: saveInfo, child: DoneButtonBackground());
  }
}
