import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/edit_profile_popup_button.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/editing_unavailable_explanation.dart';
import 'package:ruzz/pages/user_profile/nav_bar/user_profile_nav_bar.dart';
import 'package:ruzz/pages/user_profile/nav_bar/user_profile_nav_bar_android.dart';
import 'package:ruzz/pages/user_profile/options/options_list.dart';
import 'package:ruzz/pages/user_profile/user_info_view/user_info_view.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);
  static const route = "/profile";
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final isAnonymousUser = FirebaseAuth.instance.currentUser!.isAnonymous;
  late final pageBody = SafeArea(
    child: Column(children: [
      SizedBox(height: 50),
      UserInfoView(),
      SizedBox(height: 17),
      EditProfilePopupButton(), 
      isAnonymousUser ? EditingUnavailableExplanation(): SizedBox.shrink(),
      SizedBox(height: 65),
      OptionsList(),
    ]),
  );

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: const UserProfileNavBar(),
            child: pageBody,
          )
        : Scaffold(appBar: UserProfileNavBarAndroid(), body: pageBody);
  }
}