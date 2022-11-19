import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/current_user_info.dart';

class CacheConversationsLoader {
  CacheConversationsLoader(this.context);
  final BuildContext context;
  late final currentUserInfo = Provider.of<CurrentUserInfo>(
    context,
    listen: false,
  );

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> conversationsFromCache() async {
    if (currentUserInfo.myConversations.isEmpty) return [];

    final comments = <Future<DocumentSnapshot<Map<String, dynamic>>>> [];
    for (final docPath in currentUserInfo.myConversations) {
      final doc = FirebaseFirestore.instance.doc(docPath).get(
        const GetOptions(source: Source.cache),
      );
      comments.add(doc);
    }

    final loadedComments = <DocumentSnapshot<Map<String, dynamic>>> [];
    for (final comment in comments) {
      var loadedComment;
      // Throws an error when the comment is not in cache
      try { loadedComment = await comment; } 
      catch (e) { continue; }

      if (loadedComment.exists) {
        loadedComments.add(loadedComment);
        debugPrint('CacheConversationsLoader:' + loadedComment.id);
      } 
    }
    return loadedComments;
  }
}