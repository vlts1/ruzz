import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/user_info/user_info_full_page/user_logo.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/user_info/user_info_full_page/member_text_info.dart';
import 'package:ruzz/themes/colors/page_background_color.dart';
import '../../../../../firebase/users/i_user_public_info.dart';

class UserInfoFullPage extends StatelessWidget {
  UserInfoFullPage({required this.userInfo, Key? key}) : super(key: key);
  final IUserPublicInfo userInfo;
  final _backgroundColor = PageBackgroundColor();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(bottom: 35, top: 20),
      color: _backgroundColor.fromTheme(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UserLogo(logo: userInfo.logo),
          const SizedBox(height: 15),
          MemberTextInfo(joinDate: userInfo.joinDate, name: userInfo.fullName),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}