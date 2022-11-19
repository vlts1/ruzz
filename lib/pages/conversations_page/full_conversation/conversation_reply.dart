import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_page/reply/receiver_text.dart';
import 'package:ruzz/comments/comments_page/reply/reply_data.dart';
import 'package:ruzz/comments/comments_page/text_editors/reply_editor.dart';
import '../../../comments/comments_page/comment/comment_body.dart';
import '../../../comments/comments_preview/comment_preview/likes_count/likes_count.dart';
import '../../../comments/comments_preview/comment_preview/user_info/user_info.dart';

class ConversationReply extends StatelessWidget {
  const ConversationReply(this.replyData, {Key? key}) : super(key: key);
  final ReplyData replyData;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            UserInfo(
              userPublicInfo: replyData.userPublicInfo,
              commentPostDate: replyData.postedOn,
            ),
            LikesCount(
              likesCountRetriever: replyData.likesCountRetriever,
            )
          ],
        ),
        const SizedBox(height: 5),
        CommentBody(text: replyData.comment),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            replyData.receiver.receiverName != ""
                ? ReceiverText("receiver: ${replyData.receiver.receiverName}")
                : const SizedBox.shrink(),
            ReplyEditor(
              parentCommentId: replyData.parentCommentId,
              receiver: replyData.userPublicInfo.fullName,
              receiverId: replyData.replyId,
            ),
          ],
        ),
        const SizedBox(height: 18),
      ],
    );
  }
}
