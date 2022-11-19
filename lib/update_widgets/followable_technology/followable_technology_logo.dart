import 'package:flutter/material.dart';

class FollowableTechnologyLogo extends StatelessWidget {
  const FollowableTechnologyLogo({required this.logo, Key? key}) : super(key: key);
  final Widget logo;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 42,
        maxWidth: 42,
      ),
      child: logo,
    );
  }
}
