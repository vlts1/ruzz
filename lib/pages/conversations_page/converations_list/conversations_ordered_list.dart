import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/conversations_page/converations_list/sorter_by_latest_reply.dart';
import 'package:ruzz/pages/conversations_page/converations_list/i_conversations_sorter.dart';
import 'package:ruzz/providers/comments/old_new_conversations_separation.dart';
import 'package:ruzz/providers/current_user_info.dart';
import 'package:ruzz/providers/replies/loaded_replies.dart';

class ConversationsOrderedList {
  List<String> newList(BuildContext context, DateTime lastCheckedConversationsOn) {
    final currentUserInfo = Provider.of<CurrentUserInfo>(context, listen: false);
    final replies         = Provider.of<LoadedReplies>  (context, listen: false);
    final oldNewSeparator = Provider.of<OldNewConversationsSeparation>(context, listen: false);
    final IConversationsSorter conversationsSorter = SorterByLatestReply(context);

    final allConversations = currentUserInfo.myConversations.reversed.toList();

    final seenConversations   = <String> [];
    final unseenConversations = <String> [];

    for (final conversation in allConversations) {
      final conversationId  = conversation.split('/').last;
      final latestReplyDate = replies.latestReplyDate(conversationId);
      /// Do not use checkedConverastionsOn from current user info.
      /// It is refreshed immidiately after the conversations page has been opened.
      /// This is the value before the page opening.
      if (latestReplyDate.isAfter(lastCheckedConversationsOn)) {
        unseenConversations.add(conversationId);
      } else {
        seenConversations.add(conversationId);
      }
    }

    conversationsSorter.sort(unseenConversations);

    final List<String> combinedConversations = [];
    combinedConversations.addAll(unseenConversations);

    if (unseenConversations.isNotEmpty && seenConversations.isNotEmpty) {
      if (oldNewSeparator.separationIndex != unseenConversations.length - 1) {
        oldNewSeparator.separationIndex = unseenConversations.length - 1;
      }
    } else {
      if (oldNewSeparator.separationIndex != -1) {
        oldNewSeparator.separationIndex = -1;
      }
    }
    
    combinedConversations.addAll(seenConversations);
    return combinedConversations;
  }
}