import 'package:flutter/cupertino.dart';
import 'package:ruzz/firebase/comments/builder/comments_line_retriever.dart';
import 'package:ruzz/providers/comments/comments_loading_status.dart';
import '../comments_page/comment/comment_data.dart';
import '../comments_page/loading_indicator.dart';
import 'comment_preview.dart';

class CommentsPreviewsBuilder {
  CommentsPreviewsBuilder(
    this.commentsLineRetriever,
    this.commentsLoadingStatus,
    this.technology,
    this.version,
  );
  final CommentsLoadingStatus commentsLoadingStatus;
  final CommentsLineRetriever commentsLineRetriever;
  final String technology;
  final String version;

  Widget itemBuilder(BuildContext context, int index, List<CommentData> comments) {
    if (index >= comments.length - 10) {
      if (commentsLoadingStatus.isLoadingDone(technology, version) == false) {
        try { commentsLineRetriever.loadMore(); } 
        catch (e) { commentsLoadingStatus.markAsLoaded(technology, version); }
      }
    }

    if (commentsLoadingStatus.isLoadingDone(technology, version) && comments.isEmpty) {
      return SizedBox.shrink();
    }
    
    if (comments.isEmpty) return const LoadingIndicator();

    if (index == comments.length - 1) {
      if (commentsLoadingStatus.isLoadingDone(technology, version) == false) {
        return const LoadingIndicator();
      }
    }

    return CommentPreview(
      postedOn:            comments[index].postedOn,
      userInfo:            comments[index].userPublicInfo,
      bodyText:            comments[index].comment,
      likesCountRetriever: comments[index].likesCountRetriever,
    );
  }
}