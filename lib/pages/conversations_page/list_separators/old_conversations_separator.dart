import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OldConversationsSeparator extends StatelessWidget {
  const OldConversationsSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 35),
      color: CupertinoColors.systemBlue,
      width: double.infinity,
      height: 18,
      child: Center(
        child: Text('Old Conversations',
        style: TextStyle(color: Colors.white, fontSize: 11)),
      ),
    );
  }
}