import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfilePicFirebaseStorageModifier {
  ProfilePicFirebaseStorageModifier(this.context);
  final BuildContext context;

  Future<void> setProfilePic(Uint8List? pic) async {    
    if (pic != null && FirebaseAuth.instance.currentUser!.isAnonymous == false) {
      await FirebaseStorage.instance.ref().child(FirebaseAuth.instance.currentUser!.uid).putData(pic);
    } 
    else {
      debugPrint('trying to set a null picture');
    }
  }
}
