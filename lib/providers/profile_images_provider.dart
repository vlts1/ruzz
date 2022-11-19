import 'package:flutter/cupertino.dart';

class ProfileImagesProvider {
  final Map<String, Image> _uIDToLogo = {};

  void addUserLogo(String uID, Image logo) {
    _uIDToLogo[uID] = logo;
  }

  Image? getUserLogo(String uID) {
    return _uIDToLogo[uID];
  }
}