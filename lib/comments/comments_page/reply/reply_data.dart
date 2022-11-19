import 'package:ruzz/comments/comments_page/reply/reply_receiver.dart';
import '../../../firebase/users/i_user_public_info.dart';
import '../../comments_preview/comment_preview/likes_count/i_likes_count_retriever.dart';

class ReplyData {
  ReplyData(
    this.likesCountRetriever,
    this.userPublicInfo,
    this.postedOn,
    this.comment,
    this.writerId,
    this.parentCommentId,
    this.replyId,
    this.receiver,
  );
  final ILikesCountRetriever likesCountRetriever;
  final IUserPublicInfo userPublicInfo;
  final DateTime postedOn;
  final String comment;
  final String writerId;
  final String parentCommentId;
  final String replyId;
  final ReplyReceiver receiver;
}
