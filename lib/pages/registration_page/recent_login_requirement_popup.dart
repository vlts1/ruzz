import 'package:flutter/cupertino.dart';
import 'package:ruzz/pages/registration_page/account_exitor.dart';

class RecentLoginRequirementPopup extends StatelessWidget {
  RecentLoginRequirementPopup({super.key});
  final _accountExitor = AccountExitor();

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text('Security Warning'),
      content: Text(
        'Account deletion requires you to be recently logged in. Please relogin and try again.',
      ),
      actions: [
        CupertinoDialogAction(
          child: const Text("Log Out"),
          onPressed: () {
            Navigator.pop(context);
            _accountExitor.logOut(context);
          },
        ),
        CupertinoDialogAction(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}