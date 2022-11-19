import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/comment/comment_padding.dart';
import 'package:ruzz/comments/comments_page/comment/comment_replies.dart';
import 'package:ruzz/comments/comments_page/comment/fade_animation.dart';
import 'package:ruzz/comments/comments_page/text_editors/reply_editor.dart';
import 'package:ruzz/comments/comments_page/comment/comment_header.dart';
import 'package:ruzz/providers/replies/loaded_replies.dart';
import 'package:ruzz/providers/replies/replies_loading_status.dart';
import 'package:ruzz/providers/replies/replies_visibility.dart';
import 'comment_body.dart';
import 'comment_data.dart';
import 'show_replies/show_replies_button.dart';

class Comment extends StatefulWidget {
  const Comment(this.commentData, {Key? key}) : super(key: key);
  final CommentData commentData;
  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final padding = CommentPadding();
  
  late LoadedReplies        loadedReplies;
  late RepliesLoadingStatus repliesLoadingStatus;
  late RepliesVisibility    repliesVisibility;
  late CommentReplies       commentReplies;

  @override
  void didChangeDependencies() {
    loadedReplies        = Provider.of<LoadedReplies>(context);
    repliesLoadingStatus = Provider.of<RepliesLoadingStatus>(context);
    repliesVisibility    = Provider.of<RepliesVisibility>(context);
    commentReplies       = CommentReplies(repliesLoadingStatus, loadedReplies);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final replies = commentReplies.upToDateReplies(widget.commentData.commentId);
    
    return Container(
      padding: padding.edgeInsets,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommentHeader(
            widget.commentData.userPublicInfo,
            widget.commentData.postedOn,
            widget.commentData.likesCountRetriever,
          ),
          const SizedBox(height: 5),
          CommentBody(text: widget.commentData.comment),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              repliesLoadingStatus.isLoadingDone(widget.commentData.commentId) 
              && replies.length == 1
                  ? const SizedBox.shrink()
                  : ShowRepliesButton(widget.commentData.commentId),
                  
              ReplyEditor(
                parentCommentId: widget.commentData.commentId,
                receiver:   "",
                receiverId: "",
              ),
            ],
          ),
          repliesVisibility.isVisible(widget.commentData.commentId)
              ? FadeAnimation(child: Column(children: replies))
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
