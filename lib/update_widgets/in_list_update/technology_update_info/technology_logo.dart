import 'package:flutter/cupertino.dart';

class TechnologyLogo extends StatelessWidget {
  const TechnologyLogo({required this.logoImage, Key? key}) : super(key: key);
  final Widget logoImage;
  static const double size = 52.0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: logoImage,
    );
  }
}
