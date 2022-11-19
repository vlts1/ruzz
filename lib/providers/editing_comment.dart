import 'package:flutter/material.dart';

class EditingComment extends ChangeNotifier {
  String _comment = "";
  String get comment => _comment;
  set comment(String updatedComment) {
    _comment = updatedComment;
    notifyListeners();
  }
}
