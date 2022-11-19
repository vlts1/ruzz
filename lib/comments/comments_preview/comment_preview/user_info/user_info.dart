import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/user_info/comment_date/made_time_ago_formatter.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/user_info/user_info_full_page/user_info_full_page.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/user_info/user_nickname.dart';
import 'comment_date/comment_text_date.dart';
import '../../../../firebase/users/i_user_public_info.dart';
import 'user_info_full_page/user_logo.dart';

class UserInfo extends StatelessWidget {
  UserInfo({
    Key? key,
    required this.userPublicInfo,
    required this.commentPostDate,
  }) : super(key: key);

  final IUserPublicInfo userPublicInfo;
  final DateTime commentPostDate;
  final _madeTimeAgo = MadeTimeAgoFormatter();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Platform.isIOS
            ? showCupertinoModalPopup(
                context: context,
                builder: (context) {
                  return UserInfoFullPage(userInfo: userPublicInfo);
                },
              )
            : showModalBottomSheet(
                context: context,
                builder: (context) {
                  return UserInfoFullPage(userInfo: userPublicInfo);
                },
              );
      },
      child: Row(
        children: [
          UserLogo(logo: userPublicInfo.logo, witdth: 40, height: 45),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserNickname(nickname: userPublicInfo.fullName),
              CommmentTextDate(_madeTimeAgo.formattedDate(commentPostDate)),
            ],
          ),
        ],
      ),
    );
  }
}
