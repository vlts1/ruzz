import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/no_comments_comrade_message.dart';
import 'package:ruzz/providers/comments/comments_loading_status.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import '../../firebase/comments/builder/comments_line_retriever.dart';
import '../../providers/comments/loaded_comments.dart';
import 'comment/comment.dart';
import 'comment/comment_separator.dart';
import 'comment/update_info.dart';
import 'loading_indicator.dart';

class CommentsBuilder {
  CommentsBuilder(
    this.context,
    this.controller,
    this.technology,
    this.version,
    this.commentsLineRetriever,
  );

  final BuildContext context;
  final AutoScrollController controller;
  final String technology;
  final String version;
  final CommentsLineRetriever commentsLineRetriever;

  late var _commentsProvider      = Provider.of<LoadedComments>(context);
  late var _commentsLoadingStatus = Provider.of<CommentsLoadingStatus>(context);

  Widget loadComments() {
    /// Already includes comments from user conversations
    final comments = _commentsProvider.getCommentsFromUpdate(
      UpdateInfo(technology, version),
    );
    return ListView.separated(
      physics: AlwaysScrollableScrollPhysics(),
      controller: controller,
      separatorBuilder: ((context, index) {
        if (index == comments.length - 1) {
          return const SizedBox(height: 8);
        }
        return CommentSeparator();
      }),

      /// Last index is reserved for showing a loading indicator
      itemCount:   comments.length + 1,
      itemBuilder: (context, index) {
        if (index + 10 <= comments.length) {
          if (_commentsLoadingStatus.isLoadingDone(technology, version) == false) {
            commentsLineRetriever.loadMore();
          }
        }

        if (comments.isEmpty) {
          if (_commentsLoadingStatus.isLoadingDone(technology, version)) {
            return NoCommentsComradeMessage();
          }
        }

        if (index == comments.length) {
          if (_commentsLoadingStatus.isLoadingDone(technology, version) == false) {
            commentsLineRetriever.loadMore();
            return const LoadingIndicator();
          } else {
            return const SizedBox.shrink();
          }
        }

        return AutoScrollTag(
          controller: controller,
          key: ValueKey(technology + version + index.toString()),
          index: index,
          child: Comment(comments[index]),
        );
      },
    );
  }
}