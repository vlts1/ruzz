import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_page/reply/reply_data.dart';

class LoadedReplies extends ChangeNotifier {
  final _replies = <ReplyData>[];
  List<ReplyData> get replies => _replies;

  bool _replyAlreadyExists(ReplyData reply) {
    for (ReplyData loadedReply in replies) {
      if (loadedReply.replyId == reply.replyId) {
        debugPrint("Reply with ${loadedReply.replyId} id is already loaded");
        return true;
      }
    }
    return false;
  }

  void addLocalReply(ReplyData reply) {
    if (_replyAlreadyExists(reply)) return;
    _replies.add(reply);
    notifyListeners();
  }

  List<ReplyData> getRepliesFromComment(String commentId) {
    final commentReplies = <ReplyData> [];
    for (final reply in replies) {
      if (reply.parentCommentId == commentId) {
        commentReplies.add(reply);
      } 
    }
    return commentReplies;
  }

  DateTime latestReplyDate(String commentId) {
    final sortedReplies = getRepliesFromComment(commentId)
      ..sort(((one, another) {
        return one.postedOn.compareTo(another.postedOn);
      }));
    if (sortedReplies.isEmpty) return DateTime.fromMillisecondsSinceEpoch(0);
    return sortedReplies.last.postedOn;
  }

  void renameMyselfInReplies() {
    
  }
}
