import 'package:flutter/cupertino.dart';

class UserProfileNavBar extends CupertinoNavigationBar {
  const UserProfileNavBar({Key? key}) : super(key: key);
  @override
  Widget? get middle => const Text("Profile");
}
