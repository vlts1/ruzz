import 'package:ruzz/comments/comments_page/comment/update_info.dart';
import '../../../firebase/users/i_user_public_info.dart';
import '../../comments_preview/comment_preview/likes_count/i_likes_count_retriever.dart';

class CommentData {
  CommentData(
    this.likesCountRetriever,
    this.userPublicInfo,
    this.postedOn,
    this.comment,
    this.commentId,
    this.writerId,
    this.updateInfo,
  );
  final ILikesCountRetriever likesCountRetriever;
  final IUserPublicInfo userPublicInfo;

  final DateTime postedOn;
  final String comment;

  final String writerId;
  final String commentId;

  final UpdateInfo updateInfo;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CommentData && other.commentId == commentId;
  }

  @override
  int get hashCode {
    return postedOn.hashCode ^ commentId.hashCode;
  }
}
