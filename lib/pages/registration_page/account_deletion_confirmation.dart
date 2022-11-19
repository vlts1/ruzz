import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/pages/registration_page/account_deleter.dart';
import 'package:ruzz/pages/registration_page/recent_login_requirement_popup.dart';

class AccountDeletionConfirmation extends StatelessWidget {
  AccountDeletionConfirmation({super.key});
  final _accountDeleter = AccountDeleter();

  @override 
  Widget build(BuildContext context) {
    return Platform.isIOS ?
    CupertinoAlertDialog(
      title: const Text('Delete this account?'),
      content:     Text('Deletion is irreversible.'),
      actions: [
        CupertinoDialogAction(
          isDestructiveAction: true,
          child: const Text("Yes"),
          onPressed: () async {
            Navigator.pop(context);
            try {
              _accountDeleter.deleteAccount(context);
            } catch (e) {
              showCupertinoDialog(
                context: context,
                builder: (ctx) => RecentLoginRequirementPopup()
              );
            }
          },
        ),
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text("No"),
          onPressed: () { Navigator.pop(context); },
        ),
      ],
    ) : AlertDialog(
      title:   Text('Delete this account?'),
      content: Text('Deletion is irreversible.'),
      actions: [
        TextButton(
          onPressed: (() {
            Navigator.pop(context);
            _accountDeleter.deleteAccount(context);
          }), 
          child: Text('Yes'),
        ),
        TextButton(
          onPressed: (() { Navigator.pop(context); }), 
          child: Text('No'),
        )
      ],
    );
  }
}