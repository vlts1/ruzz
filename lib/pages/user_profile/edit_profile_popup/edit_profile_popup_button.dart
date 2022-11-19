import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/edit_profile_button_background.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/profile_editor.dart';
import 'package:ruzz/themes/colors/accent_button_color.dart';

import '../../../providers/current_user_info.dart';
import '../../../providers/editing_profile.dart';

class EditProfilePopupButton extends StatefulWidget {
  const EditProfilePopupButton({Key? key}) : super(key: key);

  @override
  State<EditProfilePopupButton> createState() => _EditProfilePopupButtonState();
}

class _EditProfilePopupButtonState extends State<EditProfilePopupButton> {
  final accentButtonColor = AccentButtonColor();

  late CurrentUserInfo userInfoProvider;
  late EditingProfile  profileEditorProvider;

  @override
  void didChangeDependencies() {
    profileEditorProvider = Provider.of<EditingProfile>(context);
    userInfoProvider      = Provider.of<CurrentUserInfo>(context);
    super.didChangeDependencies();
  }

  void onPressed() {
    profileEditorProvider.onEditorOpen(
      userInfoProvider.logo,
      userInfoProvider.fullName,
    );
    Platform.isIOS ?
    showCupertinoModalPopup(
      context: context,
      builder: (ctx) { return const ProfileEditor(); },
    ) :
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) { return const ProfileEditor(); },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
      ? CupertinoButton(
          child: EditProfileButtonBackground(),
          onPressed: FirebaseAuth.instance.currentUser!
            .isAnonymous 
            ? null 
            : onPressed,
        )
      : TextButton(
          onPressed: FirebaseAuth.instance.currentUser!
            .isAnonymous 
            ? null 
            : onPressed,
          child: EditProfileButtonBackground(),
        );
  }
}