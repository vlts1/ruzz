import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnonymousCommentAttemptMessage {
  void display(BuildContext context) {
    if (Platform.isIOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (ctx) {
          return CupertinoAlertDialog(
            actions: [
              CupertinoDialogAction(
                child: Text('Continue'),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
            title: Text("Please log in to write comments"),
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text("Please log in to write comments"),
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
