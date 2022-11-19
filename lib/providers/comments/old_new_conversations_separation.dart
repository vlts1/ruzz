import 'package:flutter/material.dart';

class OldNewConversationsSeparation extends ChangeNotifier {
  int _separationIndex = -1;
  int get separationIndex => _separationIndex;
  
  set separationIndex(int newIndex) {
    _separationIndex = newIndex;
    notifyListeners();
  }
}