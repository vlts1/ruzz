
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoNetworkPopup {
  NoNetworkPopup();
  static const _noConnectionMessage = 'Oops, No Internet Connection';

  Future<void> _hidePopup(BuildContext context, void Function() onHide) async {
    Navigator.pop(context);
    await Future.delayed(Duration(seconds: 3));
    onHide();
  }
  void showPopup(BuildContext context, final void Function() reconnect) {
    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: ((context) {
          return CupertinoAlertDialog(
            content: Text(_noConnectionMessage),
            actions: [
              CupertinoDialogAction(
                child: Text('Reconnect'),
                onPressed: () { _hidePopup(context, reconnect); }
              ),
            ],
          );
        }),
      );
    } else {
      showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
            content: Text(_noConnectionMessage),
            actions: [
              TextButton(
                child: Text('Reconnect'), 
                onPressed: () { _hidePopup(context, reconnect); }
              ),
            ],
          );
        }),
      );
    }
  }
}