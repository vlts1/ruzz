import 'package:flutter/material.dart';

class WidgetVisibility {
  bool isListWidgetVisible(GlobalKey key) {
    return key.currentContext?.findRenderObject() != null;
  }
}