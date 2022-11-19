import 'package:flutter/cupertino.dart';
import 'package:ruzz/comments/comments_page/reply/reply_data.dart';
import '../../../../themes/system_text_color.dart';
import 'my_replies_counter.dart';

class MyRepliesCountPreview extends StatelessWidget {
  const MyRepliesCountPreview(this.replies, {super.key});
  final List<ReplyData> replies;
  @override
  Widget build(BuildContext context) {
    final myRepliesCounter = MyRepliesCounter(context);
    final myRepliesCount = myRepliesCounter.myRepliesCount(replies);

    return Text(
      '$myRepliesCount From Me',
      style: TextStyle(color: SystemTextColor.getColor(context)),
    );
  }
}
