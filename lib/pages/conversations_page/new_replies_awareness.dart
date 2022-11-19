import 'package:ruzz/pages/conversations_page/i_new_replies_awareness.dart';
import '../../comments/comments_page/reply/reply_data.dart';

class NewRepliesAwareness implements INewRepliesAwareness {
  NewRepliesAwareness(this.replies, this.lastCheckedConversationsOn, this.userId);
  final List<ReplyData> replies;
  final DateTime        lastCheckedConversationsOn;
  final String          userId;
  
  @override
  bool userHasUnseenReplies() {
    for (final reply in replies) {
      if (reply.postedOn.isAfter(lastCheckedConversationsOn)) {
        if (reply.writerId != userId) {
          return true;
        }
      }
    }
    return false;
  }
}
