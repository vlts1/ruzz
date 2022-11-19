import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/comment_preview_body.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/user_info/comment_date/made_time_ago_formatter.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/user_info/user_info.dart';
import 'package:ruzz/pages/home_page/updates_page/app_bar/updates_page_app_bar.dart';
import 'package:ruzz/providers/comments/loaded_comments.dart';
import 'package:ruzz/update_widgets/in_list_update/header_box/header_decorator.dart';
import '../../firebase/users/i_user_public_info.dart';
import 'comment_preview/likes_count/i_likes_count_retriever.dart';
import 'comment_preview/likes_count/likes_count.dart';

class CommentPreview extends StatefulWidget {
  const CommentPreview({
    Key? key,
    required this.userInfo,
    required this.bodyText,
    required this.postedOn,
    required this.likesCountRetriever,
  }) : super(key: key);

  static const height = 200.0;
  final IUserPublicInfo      userInfo;
  final ILikesCountRetriever likesCountRetriever;
  final String               bodyText;
  final DateTime             postedOn;
  @override
  State<CommentPreview> createState() => _CommentPreviewState();
}

class _CommentPreviewState extends State<CommentPreview> {
  final commentDateFormatter = MadeTimeAgoFormatter();
  final headerDecorator = HeaderDecorator();
  late LoadedComments commentsProvider;

  @override
  void didChangeDependencies() {
    commentsProvider = Provider.of<LoadedComments>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height:     CommentPreview.height,
      padding:    const EdgeInsets.only(left: 13, right: 13, top: 8, bottom: 8),
      decoration: headerDecorator.boxDecoration(context),
      margin:     EdgeInsets.symmetric(horizontal: UpdatesPageAppBar.navBarEdgePadding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 8),

            Row(
              children: [
                UserInfo(
                  userPublicInfo:  widget.userInfo, 
                  commentPostDate: widget.postedOn,
                ),
                const Spacer(),
                const SizedBox(width: 4),
                LikesCount(likesCountRetriever: widget.likesCountRetriever),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4, top: 5),
              child: CommentPreviewBody(widget.bodyText),
            ),

          ],
        ),
      ),
    );
  }
}
