import 'package:flutter/cupertino.dart';

class IosUnsubscribeIcon extends StatelessWidget {
  const IosUnsubscribeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(
      CupertinoIcons.xmark_circle,
      color: CupertinoColors.systemRed,
    );
  }
}