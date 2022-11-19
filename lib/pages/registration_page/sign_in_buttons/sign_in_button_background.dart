import 'package:flutter/material.dart';

class SignInButtonBackground extends StatelessWidget {
  const SignInButtonBackground(this.icon, this.signInMethodName,
      {super.key});
  final Widget icon;
  final String signInMethodName;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: MediaQuery.of(context).platformBrightness == Brightness.light
            ? Colors.white
            : Colors.white10,
        border: MediaQuery.of(context).platformBrightness == Brightness.light
            ? Border.fromBorderSide(BorderSide(color: Colors.grey.shade400, width: 1.2))
            : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18),
            child: Text(signInMethodName),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: icon,
          )
        ],
      ),
    );
  }
}
