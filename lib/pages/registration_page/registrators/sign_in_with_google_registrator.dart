import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInWithGoogleRegistrator {
  Future<void> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn.standard();
    final user         = await googleSignIn.signIn();
    final googleAuth   = await user!.authentication;

    await FirebaseAuth.instance.signInWithCredential(
      GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken:     googleAuth.idToken,
      ),
    );
    debugPrint('signed in as ' + FirebaseAuth.instance.currentUser!.uid);
  }
}