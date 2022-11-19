import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/system_text_color.dart';
import 'package:ruzz/themes/system_text_size.dart';

class LikesCountNumber extends StatelessWidget {
  const LikesCountNumber({required this.likesCount, Key? key})
      : super(key: key);
  final String likesCount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 2.5),
      child: Text(
        likesCount,
        style: TextStyle(
          fontSize: SystemTextSize.fromPlatform(context) * 0.85,
          color: SystemTextColor.getColor(context),
        ),
      ),
    );
  }
}
