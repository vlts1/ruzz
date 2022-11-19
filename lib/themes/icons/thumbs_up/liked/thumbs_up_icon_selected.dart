import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'android_thumbs_up_icon_selected.dart';
import 'ios_thumbs_up_icon_selected.dart';

class ThumbsUpIconSelected extends StatelessWidget {
  const ThumbsUpIconSelected({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? const IosThumbsUpIconSelected()
        : const AndroidThumbsUpIconSelected();
  }
}
