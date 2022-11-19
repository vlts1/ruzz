import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/firebase/replies/receiver_specified_checker.dart';

import '../../providers/current_user_info.dart';

class ReplyUploader {
  ReplyUploader(this.context, {
    required this.writerId,
    required this.writerJoinDate,
    required this.writerDisplayName,
  });
  final String   writerId;
  final DateTime writerJoinDate;
  final String   writerDisplayName;
  final BuildContext context;

  final rChecker = ReceiverSpecifiedChecker();

  /// If receiver needs to be specified, both [receiver] and [receiverId]
  /// must be non-null.
  Future<DocumentReference<Map<String, dynamic>>> upload(
     String  reply,    String  originalCommentId, 
    {String? receiver, String? receiverId}) async {
        
    late final receiverReference;      
    if (rChecker.isReceiverSpecified(receiver, receiverId)) {
      receiverReference = FirebaseFirestore.instance.collection("users").doc(receiverId); 
    }
  
    final writerReference        = FirebaseFirestore.instance.collection("users").doc(writerId);
    final parentCommentReference = FirebaseFirestore.instance.collection("comments").doc(originalCommentId);
    final repliesReference       = parentCommentReference.collection("replies");

    final Future newUpload = repliesReference.add({
      "body":           reply,
      "date":           Timestamp.now(),
      "user_id":        writerReference,
      "user_join_date": Timestamp.fromDate(writerJoinDate),
      "user_name":      writerDisplayName,
      if (rChecker.isReceiverSpecified(receiver, receiverId)) "receiver"   : receiver,
      if (rChecker.isReceiverSpecified(receiver, receiverId)) "receiver_id": receiverReference,
    });

    await Provider.of<CurrentUserInfo>(context, listen: false).joinConversation(
      parentCommentReference.path
    );
    return await newUpload;
  }
}
