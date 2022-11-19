import 'package:flutter/material.dart';

class RepliesLoadingStatus extends ChangeNotifier {
  final Set<String> _commentsWithLoadedReplies = {};

  bool isLoadingDone(String commentId) {
    return _commentsWithLoadedReplies.contains(commentId);
  }

  void markAsLoaded(String commentId) {
    if (_commentsWithLoadedReplies.contains(commentId) == false) {
      _commentsWithLoadedReplies.add(commentId);
      notifyListeners();
    }
  }

  void revokeLoadedStatus(String commentId) {
    _commentsWithLoadedReplies.remove(commentId);
    notifyListeners();
  }
}
