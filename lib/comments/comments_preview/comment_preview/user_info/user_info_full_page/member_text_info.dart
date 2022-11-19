import 'package:flutter/cupertino.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/user_info/user_info_full_page/created_time_ago.dart';
import 'package:ruzz/pages/user_profile/user_info_view/membership_length.dart';
import 'full_name.dart';

class MemberTextInfo extends StatelessWidget {
  MemberTextInfo({required this.name, required this.joinDate, Key? key})
      : super(key: key);
  final String name;
  final DateTime joinDate;
  final _membershipLength = MembershipLength();

  late final bool _isAdmin = joinDate.year == 2004;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          children: [
            FullName(name: name),
            FittedBox(
              child: CreatedProfileDate(
                timeAgo: _isAdmin
                    ? 'Administrator'
                    : _membershipLength.userMemberFor(joinDate),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
