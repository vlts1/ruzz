import 'package:flutter/cupertino.dart';
import 'package:ruzz/providers/replies/loaded_replies.dart';
import 'package:ruzz/providers/replies/replies_loading_status.dart';

import '../loading_indicator.dart';
import '../reply/reply.dart';

class CommentReplies {
  CommentReplies(this.repliesLoadingStatus, this.loadedReplies);
  final RepliesLoadingStatus repliesLoadingStatus;
  final LoadedReplies loadedReplies;
  
  List<Widget> upToDateReplies(String commentId) {
    final replies = <Widget>[];
    replies.clear();
    for (final reply in loadedReplies.getRepliesFromComment(commentId)) {
      replies.add(Reply(reply));
    }

    replies.add(const SizedBox.shrink());
    if (repliesLoadingStatus.isLoadingDone(commentId) == false) {
      replies.last = const Center(child: LoadingIndicator());
    }
    
    return replies;
  }
}
