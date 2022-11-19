import 'package:flutter/material.dart';
import 'package:ruzz/themes/system_text_color.dart';
import 'package:url_launcher/url_launcher.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'By continuing you accept our ',
              style: TextStyle(color: SystemTextColor.getColor(context)),
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
      onTap: () {
        launchUrl(
          Uri(
            scheme: 'https',
            host: 'vlts1.github.io',
            path: '/',
          ),
        );
      },
    );
  }
}