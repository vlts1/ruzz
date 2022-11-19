import 'dart:developer';

import 'package:flutter/material.dart';

class ListWidgetYPosition {
  double getY(GlobalKey key) {
    if (key.currentContext?.findRenderObject() == null) {
      log("Could not find render object, widget hasn't been built yet");
      return -1;
    }
    final RenderBox box = key.currentContext?.findRenderObject() as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    return position.dy;
  }
}
