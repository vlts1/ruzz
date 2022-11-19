import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/current_user_info.dart';

class ServerConversationsLoader {
  ServerConversationsLoader(this.context, this.cacheConversations);

  final BuildContext context;
  List<DocumentSnapshot<Map<String, dynamic>>> cacheConversations;

  late final currentUserInfo = Provider.of<CurrentUserInfo>(
    context,
    listen: false,
  );

  Future<List<DocumentSnapshot>> loadServerConversations() async {
    final serverComments = <DocumentSnapshot<Map<String, dynamic>>>[];
    final cacheConversationIds = <String> [];
    
    for (final conversationDoc in cacheConversations) {
      cacheConversationIds.add(conversationDoc.id);
    }

    for (final docRef in currentUserInfo.myConversations) {
      final docId = docRef.split('/').last;
      
      if (cacheConversationIds.contains(docId) == false) {
        print('comment from server ' + docId);
        final serverComment = await FirebaseFirestore.instance
            .collection('comments')
            .doc(docId)
            .get(const GetOptions(source: Source.server));
        serverComments.add(serverComment);
      }
      
    }

    final allComments = <DocumentSnapshot<Map<String, dynamic>>>[];
    for (final doc in serverComments) {
      allComments.add(doc);
    }
    for (final doc in cacheConversations) {
      allComments.add(doc);
    }

    allComments.sort((doc, anotherDoc) {
      final docDate = doc.data()!['date'] as Timestamp;
      final anotherDocDate = anotherDoc.data()!['date'] as Timestamp;
      return docDate.compareTo(anotherDocDate);
    });

    return allComments.reversed.toList();
  }
}
