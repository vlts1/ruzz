import 'package:ruzz/providers/comments/loaded_comments.dart';
import 'package:ruzz/providers/replies/loaded_replies.dart';

class LatestConversationsActivityDate {
  LatestConversationsActivityDate(
    this.myConversationsPaths,
    this.loadedComments,
    this.loadedReplies,
  );
  final List<String>   myConversationsPaths;
  final LoadedComments loadedComments;
  final LoadedReplies  loadedReplies;

  DateTime get date {
    DateTime newestDate = DateTime.fromMillisecondsSinceEpoch(0);
    for (final conversationPath in myConversationsPaths) {
      final conversationId = conversationPath.split('/').last;
      final conversationDate = loadedComments.getCommentFromId(conversationId).postedOn;
      if (conversationDate.isAfter(newestDate)) newestDate = conversationDate;

      for (final reply in loadedReplies.getRepliesFromComment(conversationId)) {
        if (reply.postedOn.isAfter(newestDate)) newestDate = reply.postedOn;
      }
    }
    return newestDate;
  }
}
