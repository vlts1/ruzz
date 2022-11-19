import 'package:flutter/cupertino.dart';

class RemoveBookmarkIconIos extends StatelessWidget {
  const RemoveBookmarkIconIos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      CupertinoIcons.bookmark_fill,
      color: CupertinoColors.activeBlue,
    );
  }
}
