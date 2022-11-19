import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/icons/comment/comment_icon.dart';
import '../../../themes/system_text_size.dart';

class ContinueToCommentsButtonBody extends StatelessWidget {
  ContinueToCommentsButtonBody({super.key});
  final commentIcon = CommentIcon();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        commentIcon,
        Text(
          'Comments',
          style: TextStyle(fontSize: SystemTextSize.fromPlatform(context) + 1),
        ),
      ],
    );
  }
}
