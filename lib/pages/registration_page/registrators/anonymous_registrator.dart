import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AnonymousRegistrator {
  Future<void> signInAnonymously() async {
    await FirebaseAuth.instance.signInAnonymously();
    debugPrint('signed in as ' + FirebaseAuth.instance.currentUser!.uid);
  }
}
