import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/user_profile/user_info_view/membership_length.dart';
import 'package:ruzz/themes/system_text_size.dart';
import '../../../comments/comments_preview/comment_preview/user_info/comment_date/made_time_ago_formatter.dart';
import '../../../providers/current_user_info.dart';
import '../../../themes/colors/secondary_text_color.dart';
import '../../../themes/system_text_color.dart';

class UserMembership extends StatefulWidget {
  const UserMembership({Key? key}) : super(key: key);

  @override
  State<UserMembership> createState() => UserMembershipState();
}

class UserMembershipState extends State<UserMembership> {
  final secondaryTextColor = SecondaryTextColor();
  final madeTimeAgo = MadeTimeAgoFormatter();
  late CurrentUserInfo userInfoProvider;
  final MembershipLength membershipLength = MembershipLength();
  @override
  void didChangeDependencies() {
    userInfoProvider = Provider.of<CurrentUserInfo>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:  MainAxisAlignment.center,
      children: [
        Text(
          userInfoProvider.fullName,
          style: TextStyle(
            color:    SystemTextColor.getColor(context),
            fontSize: SystemTextSize.fromPlatform(context),
          ),
        ),
        FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            membershipLength.userMemberFor(userInfoProvider.joinDate),
            style: TextStyle(
              color: secondaryTextColor.fromTheme(context),
              fontWeight: FontWeight.w300,
              fontSize: SystemTextSize.fromPlatform(context) - 1,
            ),
          ),
        ),
      ],
    );
  }
}
