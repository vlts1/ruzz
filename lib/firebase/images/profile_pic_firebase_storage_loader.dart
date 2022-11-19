import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/providers/current_user_info.dart';

class ProfilePicFirebaseStorageLoader {
  ProfilePicFirebaseStorageLoader(this.context);
  final BuildContext context;
  late final currentUserInfo = Provider.of<CurrentUserInfo>(context, listen: false);

  Future<Image> get profilePic async {
    if (FirebaseAuth.instance.currentUser!.isAnonymous) return Image.asset('images/def-icon-blue.png');
    
    final image = await FirebaseStorage.instance
        .ref()
        .child(FirebaseAuth.instance.currentUser!.uid)
        .getData();
    if (image == null) {
      debugPrint('User profile image is null');
      return Image.asset('def-icon-blue.png');
    }
    return Image.memory(image);
  }
}
