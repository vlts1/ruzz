import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContinueWithTopicMaterialButton extends StatelessWidget {
  ContinueWithTopicMaterialButton(this.onClick, {super.key});
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onClick,
      child: Center(child: Text('Continue')),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(5)),
        padding:   MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: CupertinoColors.systemBlue, width: 0.5),
          ),
        ),
      ),
    );
  }
}
