import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoInternetPostingMessage {
  void showMessage(BuildContext context) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: ((context) {
          return CupertinoAlertDialog(
            actions: [
              CupertinoDialogAction(
                onPressed: () { Navigator.pop(context); },
                child: Text('OK'),
              )
            ],
            title:   Text("Network is currently unavailable"),
            content: Text('Your comment will be automatically posted once the connection is restored.'),
          );
        }),
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title:   Text("Network is currently unavailable"),
            content: Text('Your comment will be automatically posted once the connection is restored.'),
            actions: [
              TextButton(
                onPressed: () { Navigator.pop(context); },
                child: Text('OK'),
              )
            ],
          );
        },
      );
    }
  }
}