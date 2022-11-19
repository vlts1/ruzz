import 'package:flutter/cupertino.dart';

class LatestLoadedUpdateIndex {
  int _index = -1;
  int get index => _index;
  void setNewIndex(int newIndex) {
    if (newIndex.isNegative) {
      debugPrint("Error in LatestLoadedUpdateIndex: new index cannot be negative");
      return;
    }
    if (newIndex -1 != index) {
      throw Exception("Some list view indexes were skipped during loading");
    }

    _index++;
  }
}
