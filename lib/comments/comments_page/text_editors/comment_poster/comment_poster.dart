import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/comment/update_info.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/likes_count/likes_count_retriever.dart';
import 'package:ruzz/providers/comments/loaded_comments.dart';
import 'package:ruzz/providers/replies/replies_loading_status.dart';
import '../../../../firebase/comments/comment_uploader.dart';
import '../../../../providers/current_user_info.dart';
import '../../../../providers/editing_comment.dart';
import '../../comment/comment_data.dart';

class CommentPoster {
  CommentPoster(this.technology, this.version);
  final String technology;
  final String version;
  
  Future<void> post(BuildContext context) async {
    final commentsProvider       = Provider.of<LoadedComments>      (context, listen: false);
    final editingCommentProvider = Provider.of<EditingComment>      (context, listen: false);
    final currentUserInfo        = Provider.of<CurrentUserInfo>     (context, listen: false);
    final repliesLoadingProvider = Provider.of<RepliesLoadingStatus>(context, listen: false);

    final comment = editingCommentProvider.comment.trimRight();
    editingCommentProvider.comment = "";
    
    final commentUploader = CommentUploader(
      userId:          currentUserInfo.docId,
      userJoinDate:    currentUserInfo.joinDate,
      userDisplayName: currentUserInfo.fullName,
      context:         context,
    );

    final newComment = await commentUploader.upload(
      technology,
      version,
      comment,
    );
    
    final likesCountRetriever = LikesCountRetriever(
      newComment.path, 
      currentUserInfo.docId, 
      currentUserInfo.docId,
    );

    await likesCountRetriever.init();
    
    /// Since the comment just got posted, and has no replies. 
    repliesLoadingProvider.markAsLoaded(newComment.id);

    commentsProvider.addLocalComment(
      CommentData(
        likesCountRetriever,
        currentUserInfo,
        DateTime.now(),
        comment,
        newComment.id,
        currentUserInfo.docId,
        UpdateInfo(technology, version),
      ),
    );
  }
}