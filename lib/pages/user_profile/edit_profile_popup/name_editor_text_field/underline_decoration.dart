import 'package:flutter/cupertino.dart';

class UnderlineDecoration extends BoxDecoration {
  @override
  BoxBorder? get border => const Border(
        bottom: BorderSide(
          width: 0.18,
          color: CupertinoColors.systemGrey,
        ),
      );
}
