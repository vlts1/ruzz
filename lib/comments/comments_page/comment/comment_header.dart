import 'package:flutter/cupertino.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/user_info/user_info.dart';
import '../../../firebase/users/i_user_public_info.dart';
import '../../comments_preview/comment_preview/likes_count/i_likes_count_retriever.dart';
import '../../comments_preview/comment_preview/likes_count/likes_count.dart';

class CommentHeader extends StatelessWidget {
  const CommentHeader(
    this.userPublicInfo,
    this.postedOn,
    this.likesCountRetriever, {
    super.key,
  });

  final IUserPublicInfo userPublicInfo;
  final DateTime postedOn;
  final ILikesCountRetriever likesCountRetriever;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        UserInfo(
          userPublicInfo: userPublicInfo,
          commentPostDate: postedOn,
        ),
        LikesCount(likesCountRetriever: likesCountRetriever),
      ],
    );
  }
}
