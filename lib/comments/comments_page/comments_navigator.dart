import 'package:flutter/cupertino.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

import '../../firebase/comments/builder/comments_line_retriever.dart';
import 'comments_page.dart';

class CommentsNavigator {
  CommentsNavigator(this.technology, this.version);
  String technology;
  String version;
  final AutoScrollController commentsController = AutoScrollController();

  set previewedComment(int newPosition) => _previewedComment = newPosition;
  int _previewedComment = 0;

  void openComments(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) {
          return CommentsPage(
            technology,
            version,
            commentsLineRetriever: CommentsLineRetriever(technology, version, context),
            controller: commentsController,
          );
        },
      ),
    );
    _goToPreviewedComment();
  }

  void _goToPreviewedComment() {
    commentsController.scrollToIndex(
      _previewedComment,
      duration: const Duration(milliseconds: 1200),
      preferPosition: AutoScrollPosition.middle,
    );
  }
}
