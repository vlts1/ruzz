import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AnonymousBookmarkAttemptMessage {
  void display(BuildContext context) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (ctx) {
          return CupertinoAlertDialog(
            actions: [
              CupertinoDialogAction(
                child: Text('Continue'),
                onPressed: () { Navigator.pop(context); },
              )
            ],
            title: Text("Please log in to bookmark updates"),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Please log in to bookmark updates"),
            actions: [
              TextButton(
                onPressed: () { Navigator.pop(context); }, 
                child: Text('Continue'),
              ),
            ],
          );
        },
      );
    }
  }
}