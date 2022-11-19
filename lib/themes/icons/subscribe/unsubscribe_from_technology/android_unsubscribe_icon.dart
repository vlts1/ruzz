import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AndroidUnsubscribeIcon extends StatelessWidget {
  const AndroidUnsubscribeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.cancel_outlined,
      color: CupertinoColors.systemRed,
    );
  }
}
