import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosThumbsUpIconSelected extends StatelessWidget {
  const IosThumbsUpIconSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Platform.isIOS ? CupertinoIcons.hand_thumbsup_fill : Icons.thumb_up,
      color: const Color.fromARGB(255, 255, 0, 0),
    );
  }
}
