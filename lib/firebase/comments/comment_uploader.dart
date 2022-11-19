import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/providers/current_user_info.dart';

class CommentUploader {
  CommentUploader({
    required this.userId,
    required this.userJoinDate,
    required this.userDisplayName,
    required this.context,
  });
  final String       userId;
  final DateTime     userJoinDate;
  final String       userDisplayName;
  final BuildContext context;

  Future<DocumentReference<Map<String, dynamic>>> upload(String technology, String version, String comment) async {
    final userReference     = FirebaseFirestore.instance.collection("users").doc(userId);
    final commentsReference = FirebaseFirestore.instance.collection('comments');

    final uploadedComment = await commentsReference.add({
      "body":           comment,
      "date":           Timestamp.now(),
      "technology":     technology,
      "user_id":        userReference,
      "user_join_date": Timestamp.fromDate(userJoinDate),
      "user_name":      userDisplayName,
      "version":        version,
    });


    await Provider.of<CurrentUserInfo>(context, listen: false).joinConversation(
      uploadedComment.path
    );
    return uploadedComment;
  }
}
