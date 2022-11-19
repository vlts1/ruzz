import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditingProfile extends ChangeNotifier {
  Image?    _userLogo;
  Uint8List? logoAsBytes;
  Image get userLogo {
    if (_userLogo == null) {
      throw Exception("You must set user logo in onEditorOpen");
    }
    return _userLogo!;
  }

  void setUserLogo(Uint8List newLogo) {
    _userLogo = Image.memory(newLogo);
    logoAsBytes = newLogo;
    debugPrint("New logo in editor");
    notifyListeners();
  }

  String get userName {
    return _userName;
  }

  String _userName = "";

  set userName(String name) {
    this._userName = name;
    debugPrint("new name in editor: $_userName");
    notifyListeners();
  }

  void onEditorOpen(Image currentLogo, String currentName) {
    _userLogo = currentLogo;
    _userName = currentName;
  }
}
