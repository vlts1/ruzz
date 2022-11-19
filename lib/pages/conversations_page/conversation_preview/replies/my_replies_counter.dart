import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/reply/reply_data.dart';
import 'package:ruzz/providers/current_user_info.dart';

class MyRepliesCounter {
  MyRepliesCounter(this.context) {
    currentUserInfo = Provider.of<CurrentUserInfo>(context);
  }
  final BuildContext context;
  late final CurrentUserInfo currentUserInfo;
  
  int myRepliesCount(List<ReplyData> replies) {
    int count = 0;
    for (final reply in replies) {
      if (reply.writerId == currentUserInfo.docId) {
        count++;
      }
    }
    return count;
  }
}
