import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/comment/comment_body.dart';
import 'package:ruzz/comments/comments_page/comment/comment_data.dart';
import 'package:ruzz/comments/comments_page/comment/comment_header.dart';
import 'package:ruzz/pages/conversations_page/full_conversation/named_divider.dart';
import 'package:ruzz/pages/conversations_page/full_conversation/reply_data_viewer.dart';

import '../../../comments/comments_page/text_editors/reply_editor.dart';
import '../../../providers/replies/loaded_replies.dart';

class FullConversationWidget extends StatefulWidget {
  const FullConversationWidget(this.commentData, {super.key});
  final CommentData commentData;

  @override
  State<FullConversationWidget> createState() => _FullConversationWidgetState();
}

class _FullConversationWidgetState extends State<FullConversationWidget> {
  late LoadedReplies loadedReplies;
  final replyDataViewer = ReplyDataViewer();
  
  @override
  void didChangeDependencies() {
    loadedReplies = Provider.of<LoadedReplies>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final repliesData = loadedReplies.getRepliesFromComment(widget.commentData.commentId);
    final repliesView = replyDataViewer.repliesToWidget(repliesData.reversed.toList());
    return SafeArea(
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommentHeader(
              widget.commentData.userPublicInfo,
              widget.commentData.postedOn,
              widget.commentData.likesCountRetriever,
            ),
            CommentBody(text: widget.commentData.comment),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ReplyEditor(
                  parentCommentId: widget.commentData.commentId,
                  receiver:   "",
                  receiverId: "",
                ),
              ],
            ),
            repliesData.isNotEmpty
                ? const NamedDivider(name: 'Replies')
                : const SizedBox.shrink(),
        
            repliesView,
          ],
        ),
      ),
    );
  }
}
