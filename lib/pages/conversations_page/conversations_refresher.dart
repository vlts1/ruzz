import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../firebase/replies/replies_line_retriever.dart';
import '../../providers/replies/replies_loading_status.dart';

class ConversationsRefresher {
  Future<void> refresh(BuildContext context, List<String> oldConversationPaths) async {
    final repliesLoadingStatus = Provider.of<RepliesLoadingStatus>(
      context, listen: false,
    );
    for (final comment in oldConversationPaths) {
      repliesLoadingStatus.revokeLoadedStatus(comment.split('/').last);
      await RepliesLineRetriever(comment.split('/').last).load(context);
    }
  }
}