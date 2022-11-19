import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class SignInWithAppleRegistrator {
  Future<void> signInWithApple() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [AppleIDAuthorizationScopes.fullName],
    );
    final oAuthCredential = OAuthProvider('apple.com').credential(
      idToken:  appleCredential.identityToken,
      rawNonce: generateNonce(),
    );
    await FirebaseAuth.instance.signInWithCredential(oAuthCredential);
    debugPrint('signed in as ' + FirebaseAuth.instance.currentUser!.uid);
  }
}
