import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/conversations_page/converations_list/i_conversations_sorter.dart';

import '../../../providers/replies/loaded_replies.dart';

class SorterByLatestReply implements IConversationsSorter {
  SorterByLatestReply(this.context);
  final BuildContext context;

  @override
  List<String> sort(List<String> conversations) {
    final replies = Provider.of<LoadedReplies>(context, listen: false);
    conversations.sort((one, another) {
      final DateTime oneLatestReplyDate     = replies.latestReplyDate(one);
      final DateTime anotherLatestReplyDate = replies.latestReplyDate(another);
      return anotherLatestReplyDate.compareTo(oneLatestReplyDate);
    });

    return conversations;
  }
}
