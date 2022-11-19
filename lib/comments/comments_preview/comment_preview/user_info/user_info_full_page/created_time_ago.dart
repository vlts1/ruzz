import 'package:flutter/cupertino.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/user_info/comment_date/comment_text_date.dart';

class CreatedProfileDate extends StatelessWidget {
  const CreatedProfileDate({required this.timeAgo, Key? key}) : super(key: key);
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    return CommmentTextDate(timeAgo);
  }
}
