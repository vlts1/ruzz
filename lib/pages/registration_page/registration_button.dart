import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'sign_in_buttons/sign_in_button_background.dart';

class RegistrationButton extends StatelessWidget {
  RegistrationButton(
    this.registrationServiceImage, 
    this.signIn, 
    this.registrationServiceMethod, 
    {super.key}
  );
  final Widget registrationServiceImage;
  final String registrationServiceMethod;
  final void Function() signIn;

  late final body = Center(
          child: SignInButtonBackground(
            registrationServiceImage,
            registrationServiceMethod,
          ),
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      child: Platform.isIOS ? CupertinoButton(
        onPressed: signIn,
        child: body,
      ) : TextButton(onPressed: signIn, child: body),
    );
  }
}