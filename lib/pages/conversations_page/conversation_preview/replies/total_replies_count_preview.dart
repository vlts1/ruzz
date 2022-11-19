import 'package:flutter/cupertino.dart';
import 'package:ruzz/comments/comments_page/reply/reply_data.dart';
import '../../../../themes/system_text_color.dart';

class TotalRepliesCountPreview extends StatelessWidget {
  const TotalRepliesCountPreview(this.replies, {super.key});
  final List<ReplyData> replies;
  @override
  Widget build(BuildContext context) {
    final repliesText = replies.length == 1 ? 'Reply' : 'Replies';
    return Text(
      '${replies.length} $repliesText',
      style: TextStyle(color: SystemTextColor.getColor(context)),
    );
  }
}
