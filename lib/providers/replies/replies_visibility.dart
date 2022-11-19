import 'package:flutter/material.dart';

class RepliesVisibility extends ChangeNotifier {
  final Set<String> _commentsWithVisibleReplies = {};

  void setVisible(String commentId) {
    if (_commentsWithVisibleReplies.contains(commentId)) {
      debugPrint("Replies with parent $commentId id are already loaded"); 
      return;
    }
    _commentsWithVisibleReplies.add(commentId);
    notifyListeners();
  }

  void setHidden(String commentId) {
    _commentsWithVisibleReplies.remove(commentId);
    notifyListeners();
  }

  bool isVisible(String commentId) {
    return _commentsWithVisibleReplies.contains(commentId);
  }
}
