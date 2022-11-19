import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:ruzz/pages/registration_page/account_deletion_confirmation.dart';
import 'option_description.dart';
import 'option_name.dart';

class DeleteAccountTimCookRequest extends StatefulWidget {
  const DeleteAccountTimCookRequest({super.key});

  @override
  State<DeleteAccountTimCookRequest> createState() => _DeleteAccountTimCookRequestState();
}

class _DeleteAccountTimCookRequestState extends State<DeleteAccountTimCookRequest> {
@override
  Widget build(BuildContext context) {
    if (Platform.isAndroid && FirebaseAuth.instance.currentUser!.isAnonymous == false) {
      return SizedBox.shrink();
    }
    return GestureDetector(
      onTap: () {
        showCupertinoDialog(
          context: context,
          builder: (ctx) => AccountDeletionConfirmation(),
        );
      },
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
                OptionName('Delete Account'),
                const SizedBox(height: 9),
                OptionDescription('Permanently delete this account.'),
                const SizedBox(height: 7),
              ],
            ),
          ),
          Icon(CupertinoIcons.trash, color: CupertinoColors.systemRed),
        ],
      ),
    );
  }
}