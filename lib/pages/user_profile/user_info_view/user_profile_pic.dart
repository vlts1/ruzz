import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../comments/comments_preview/comment_preview/user_info/user_info_full_page/circular_image_decoration.dart';
import '../../../providers/current_user_info.dart';

class UserProfilePick extends StatefulWidget {
  const UserProfilePick({Key? key}) : super(key: key);

  @override
  State<UserProfilePick> createState() => _UserProfilePickState();
}

class _UserProfilePickState extends State<UserProfilePick> {
  late CurrentUserInfo userInfoProvider;

  @override
  void didChangeDependencies() {
    userInfoProvider = Provider.of<CurrentUserInfo>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: CircularImageDecoration(userInfoProvider.logo),
    );
  }
}
