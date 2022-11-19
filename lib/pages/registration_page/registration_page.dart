import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ruzz/pages/registration_page/privacy_policy.dart';
import 'package:ruzz/pages/registration_page/registration_button.dart';
import 'package:ruzz/pages/registration_page/technologies_preview_line.dart';
import 'package:ruzz/themes/colors/page_background_color.dart';
import 'package:ruzz/themes/system_text_color.dart';
import 'registrators/anonymous_registrator.dart';
import 'registrators/sign_in_with_apple_registrator.dart';
import 'registrators/sign_in_with_google_registrator.dart';

class RegistrationPage extends StatefulWidget {
  RegistrationPage({super.key});
  static const route = "/registration";

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _appleSignIn     = SignInWithAppleRegistrator();
  final _googleSignIn    = SignInWithGoogleRegistrator();
  final _anonymousSignIn = AnonymousRegistrator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: PageBackgroundColor().fromTheme(context),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30),
              Container(child: TechnologiesPreviewLine(), height: 50),
              Spacer(flex: 4),
              Text(
                'Welcome to Ruzz',
                style: TextStyle(
                  fontSize: 34,
                  color: SystemTextColor.getColor(context),
                ),
              ),
              SizedBox(height: 40),
              Platform.isIOS
                  ? RegistrationButton(
                      Padding(
                        padding: const EdgeInsets.only(right: 3),
                        child: Image.asset(
                            MediaQuery.of(context).platformBrightness == Brightness.light
                                ? 'images/apple-logo.png'
                                : 'images/apple-logo-white.png',
                            width:  21,
                            height: 21,
                          ),
                      ),
                      _appleSignIn.signInWithApple,
                      'Sign in with Apple',
                    )
                  : SizedBox.shrink(),

              RegistrationButton(
                Padding(
                  padding: const EdgeInsets.only(right: 3),
                  child: Image.asset('images/google-logo.png', width: 21, height: 21),
                ),
                _googleSignIn.signInWithGoogle,
                'Sign in with Google',
              ),

              RegistrationButton(
                Icon(Icons.skip_next_rounded, size: 28),
                _anonymousSignIn.signInAnonymously,
                'Skip for now',
              ),
              Spacer(flex: 4),
              PrivacyPolicy(),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}