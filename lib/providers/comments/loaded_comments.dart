import 'package:flutter/material.dart';
import '../../comments/comments_page/comment/comment_data.dart';
import '../../comments/comments_page/comment/update_info.dart';

class LoadedComments extends ChangeNotifier {
  final _comments = <CommentData>[];
  List<CommentData> get comments => _comments;

  void addLocalComment(CommentData comment) {
    if (comments.contains(comment) == false) {
      debugPrint('LoadedComments: added a comment');
      _comments.add(comment);
    }
    notifyListeners();
  }

  void updateLikesCount() {
    /// Widgets use a shared reference to comments
    notifyListeners();
  }

  CommentData getCommentFromId(String id) {
    debugPrint('LoadedComments: comment from id ' + id);
    return comments.singleWhere((comment) => comment.commentId == id);
  }

  List<CommentData> getCommentsFromUpdate(UpdateInfo updateInfo) {
    final updateComments = <CommentData> [];
    for (CommentData comment in comments) {
      if (comment.updateInfo == updateInfo) {
        updateComments.add(comment);
      }
    }
    return updateComments;
  }
}