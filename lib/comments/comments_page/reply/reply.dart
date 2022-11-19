import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_page/reply/receiver_text.dart';
import 'package:ruzz/comments/comments_page/reply/reply_data.dart';
import 'package:ruzz/comments/comments_page/text_editors/reply_editor.dart';
import '../../comments_preview/comment_preview/likes_count/likes_count.dart';
import '../../comments_preview/comment_preview/user_info/user_info.dart';
import '../comment/comment_body.dart';

class Reply extends StatelessWidget {
  const Reply(this.replyData, {Key? key}) : super(key: key);
  final ReplyData replyData;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:     const EdgeInsets.only(left: 17, top: 15, bottom: 15),
      padding:    const EdgeInsets.only(left: 13),
      decoration: const BoxDecoration(
        border: Border(left: BorderSide(color: Colors.grey,width: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserInfo(
                userPublicInfo:  replyData.userPublicInfo,
                commentPostDate: replyData.postedOn,
              ),
              LikesCount(likesCountRetriever: replyData.likesCountRetriever)
            ],
          ),
          const SizedBox(height: 5),
          CommentBody(text: replyData.comment),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              replyData.receiver.receiverName.isNotEmpty
                  ? ReceiverText("receiver: ${replyData.receiver.receiverName}")
                  : const SizedBox.shrink(),

              ReplyEditor(
                parentCommentId: replyData.parentCommentId,
                receiver:        replyData.userPublicInfo.fullName,
                receiverId:      replyData.writerId,
              ),
            ],
          ),
        ],
      ),
    );
  }
}