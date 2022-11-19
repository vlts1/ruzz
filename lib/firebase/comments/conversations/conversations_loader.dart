import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/firebase/comments/conversations/cache_conversations_loader.dart';
import 'package:ruzz/firebase/comments/builder/firestore_comments_local_saver.dart';
import 'package:ruzz/firebase/comments/conversations/server_conversations_loader.dart';
import 'package:ruzz/providers/current_user_info.dart';

class ConversationsLoader {
  ConversationsLoader(this.context);
  final BuildContext context;

  late final currentUserInfo = Provider.of<CurrentUserInfo>(
    context,
    listen: false,
  );

  late final _firestoreCommentsLocalSaver = FirestoreCommentsLocalSaver(context);
  late final _cacheConversationsLoader    = CacheConversationsLoader(context);

  Future<void> loadComments() async {
    if (currentUserInfo.myConversations.isEmpty) return;
    final cacheConversations = await _cacheConversationsLoader.conversationsFromCache();
    final _serverConversationsLoader = ServerConversationsLoader(
      context,
      cacheConversations,
    );

    await _firestoreCommentsLocalSaver.saveLocally(
      await _serverConversationsLoader.loadServerConversations(),
    );
    print('conversation comments loaded');
  }
}
