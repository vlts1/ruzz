import 'package:flutter/cupertino.dart';
import '../../../comments/comments_page/reply/reply_data.dart';
import 'conversation_reply.dart';

class ReplyDataViewer {
  Widget repliesToWidget(List<ReplyData> replyDataObjects) {
    final viewReplies = <Widget>[];
    for (final reply in replyDataObjects.reversed) {
      viewReplies.add(ConversationReply(reply));
    }
    return Column(children: viewReplies);
  }
}