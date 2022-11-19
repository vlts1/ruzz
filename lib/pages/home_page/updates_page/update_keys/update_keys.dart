import 'package:flutter/material.dart';

class UpdateKeys {
  final List<GlobalKey> _indexKeys = [];

  GlobalKey getKey(int index) {
    assert(index <= _indexKeys.length, "Index in update list was skipped");

    if (_indexKeys.length == index) {
      _indexKeys.add(GlobalKey());
    } 
    return _indexKeys[index];
  }
}
