import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/firebase/comments/comments_before_position.dart';
import '../../providers/comments/loaded_comments.dart';
import 'comment/update_info.dart';

class CommentsRefresher {
  CommentsRefresher(this.context);
  final BuildContext context;

  late final _commentsBeforePosition = CommentsBeforePosition(context);
  
  Future<void> refreshComments(String technology, String version) async {
    late LoadedComments _commentsProvider = Provider.of<LoadedComments>(context, listen: false);
    final comments = _commentsProvider.getCommentsFromUpdate(
      UpdateInfo(technology, version),
    );

    await _commentsBeforePosition.loadEarlierComments(comments.first.commentId);
  }
}
