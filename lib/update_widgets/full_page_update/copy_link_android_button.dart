import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ruzz/themes/icons/copy_link/copy_link_icon.dart';

class CopyLinkAndroidButton extends StatelessWidget {
  const CopyLinkAndroidButton(this.link, {Key? key}) : super(key: key);
  final String link;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Fluttertoast.showToast(msg: "Link has been copied");
        Clipboard.setData(ClipboardData(text: link));
      },
      padding: const EdgeInsets.only(left: 8, right: 5, bottom: 2),
      icon: const CopyLinkIcon(),
    );
  }
}
