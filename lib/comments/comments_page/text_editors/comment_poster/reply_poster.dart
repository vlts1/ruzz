import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/providers/replies/loaded_replies.dart';
import '../../../../firebase/replies/receiver_specified_checker.dart';
import '../../../../firebase/replies/reply_uploader.dart';
import '../../../../providers/current_user_info.dart';
import '../../../../providers/editing_comment.dart';
import '../../../comments_preview/comment_preview/likes_count/local_likes_count_retriever.dart';
import '../../reply/reply_data.dart';
import '../../reply/reply_receiver.dart';

class ReplyPoster {
  ReplyPoster(this.parentCommentId, this.receiver, this.receiverId, this.context);
  final String parentCommentId;
  final String receiver;
  final String receiverId;
  final BuildContext context;

  Future<void> post(BuildContext context) async {
    final repliesProvider        = Provider.of<LoadedReplies>  (context, listen: false);
    final editingCommentProvider = Provider.of<EditingComment> (context, listen: false);
    final currentUserInfo        = Provider.of<CurrentUserInfo>(context, listen: false);

    final comment = editingCommentProvider.comment.trimRight();
    editingCommentProvider.comment = "";

    final replyPoster = ReplyUploader(
      writerId:          currentUserInfo.docId,
      writerJoinDate:    currentUserInfo.joinDate,
      writerDisplayName: currentUserInfo.fullName,
      context,
    );

    final newReply = await replyPoster.upload(
      comment,
      parentCommentId,
      receiver: receiver,
      receiverId: receiverId,
    );

    final receiverChecker = ReceiverSpecifiedChecker();
    ReplyReceiver replyReceiver;
    receiverChecker.isReceiverSpecified(receiver, receiverId)
        ? replyReceiver = ReplyReceiver(receiver, receiverId)
        : replyReceiver = ReplyReceiver("", "");

    repliesProvider.addLocalReply(
      ReplyData(
        LocalLikesCountRetriever(),
        currentUserInfo,
        DateTime.now(),
        comment,
        currentUserInfo.docId,
        parentCommentId,
        newReply.id,
        replyReceiver,
      ),
    );
  }
}