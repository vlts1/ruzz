import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/comment/comment_body.dart';
import 'package:ruzz/comments/comments_page/comment/comment_data.dart';
import 'package:ruzz/comments/comments_page/comment/comment_padding.dart';
import 'package:ruzz/comments/comments_page/reply/reply_data.dart';
import 'package:ruzz/pages/conversations_page/converations_list/conversations_ordered_list.dart';
import 'package:ruzz/pages/conversations_page/conversation_preview/continue_with_topic_button.dart';
import 'package:ruzz/comments/comments_page/comment/comment_header.dart';
import 'package:ruzz/pages/conversations_page/conversation_preview/replies/total_replies_count_preview.dart';
import 'package:ruzz/pages/conversations_page/full_conversation/full_page_conversation.dart';
import 'package:ruzz/providers/comments/loaded_comments.dart';
import 'package:ruzz/providers/replies/loaded_replies.dart';
import 'replies/my_replies_count_preview.dart';

class ConversationWidget extends StatefulWidget {
  const ConversationWidget(
      this.conversationIndex, this.lastCheckedConversationsOn,
      {super.key});
  final int conversationIndex;
  final DateTime lastCheckedConversationsOn;
  @override
  State<ConversationWidget> createState() => _ConversationWidgetState();
}

class _ConversationWidgetState extends State<ConversationWidget> {
  late List<ReplyData> replies;
  late CommentData commentData;
  final conversationsOrderedList = ConversationsOrderedList();

  @override
  void didChangeDependencies() {
    final conversations = conversationsOrderedList.newList(
      context,
      widget.lastCheckedConversationsOn,
    );

    commentData = Provider.of<LoadedComments>(context).getCommentFromId(
      conversations[widget.conversationIndex],
    );
    replies = Provider.of<LoadedReplies>(context).getRepliesFromComment(
      conversations[widget.conversationIndex],
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: CommentPadding().edgeInsets,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommentHeader(
              commentData.userPublicInfo,
              commentData.postedOn,
              commentData.likesCountRetriever,
            ),
            const SizedBox(height: 5),
            CommentBody(text: commentData.comment),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textBaseline: TextBaseline.alphabetic,
              textDirection: TextDirection.ltr,
              children: [
                TotalRepliesCountPreview(replies),
                MyRepliesCountPreview(replies),
              ],
            ),
            const SizedBox(height: 20),
            Center(child: ContinueWithTopicButton(() {
              Navigator.pushNamed(
                context,
                FullPageConversation.route,
                arguments: commentData,
              );
            })),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
