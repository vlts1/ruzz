import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/user_profile/user_info_view/user_membership.dart';
import 'package:ruzz/pages/user_profile/user_info_view/user_profile_pic.dart';
import 'package:ruzz/providers/current_user_info.dart';
import 'package:ruzz/themes/colors/secondary_text_color.dart';

class UserInfoView extends StatefulWidget {
  const UserInfoView({Key? key}) : super(key: key);
  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  final secondaryTextColor = SecondaryTextColor();
  late CurrentUserInfo userInfoProvider;

  @override
  void didChangeDependencies() {
    userInfoProvider = Provider.of<CurrentUserInfo>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        children: const [
          UserProfilePick(),
          SizedBox(width: 20),
          UserMembership(),
        ],
      ),
    );
  }
}
