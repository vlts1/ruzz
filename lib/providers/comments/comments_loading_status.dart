import 'package:flutter/material.dart';

class CommentsLoadingStatus extends ChangeNotifier {
  final Set<String> _updatesWithLoadedComments = {};

  bool isLoadingDone(String technology, String version) {
    return _updatesWithLoadedComments.contains(technology + version);
  }

  void markAsLoaded(String technology, String version) {
    if (isLoadingDone(technology, version)) {
      debugPrint("$technology $version is already loaded");
      return;
    }

    _updatesWithLoadedComments.add(technology + version);
    notifyListeners();
  }
}
