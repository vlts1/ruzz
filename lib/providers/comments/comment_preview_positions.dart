import 'package:flutter/cupertino.dart';

/// If used outside of the updates page -- the last previewed comment will be
/// shared. 
class CommentPreviewPositions extends ChangeNotifier {
  final Map<String, int> _updateToVisiblePreview = {};

  void notifyPreviewsOfOrderChange() {
    notifyListeners();
  }

  void setVisiblePreview(String technology, String version, int commentIndex) {
    _updateToVisiblePreview[technology + version] = commentIndex;
  }

  int getVisiblePreview(String technology, String version) {
    final previewIndex = _updateToVisiblePreview[technology + version];
    if (previewIndex != null) return previewIndex;
    else return 0;
  }
}
