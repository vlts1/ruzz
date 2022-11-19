import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/pages/registration_page/account_exitor.dart';
import 'package:ruzz/pages/user_profile/options/option_description.dart';
import 'package:ruzz/pages/user_profile/options/option_name.dart';
import '../../../themes/icons/exit_icon/exit_icon.dart';

class LogoutOption extends StatefulWidget {
  const LogoutOption({Key? key}) : super(key: key);
  @override
  State<LogoutOption> createState() => _LogoutOptionState();
}

class _LogoutOptionState extends State<LogoutOption> {
  final accountExitor = AccountExitor();
  
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser!.isAnonymous) return SizedBox.shrink();
    return GestureDetector(
      onTap: () { accountExitor.logOut(context); },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                OptionName('Exit Account'),
                const SizedBox(height: 9),
                OptionDescription(
                  'Log out from the app to create or switch user accounts.',
                ),
                const SizedBox(height: 7),
              ],
            ),
          ),
          ExitIcon(),
        ],
      ),
    );
  }
}
