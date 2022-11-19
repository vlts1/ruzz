import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IosReleaseIcon extends StatelessWidget {
  const IosReleaseIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'images/ios-update-icon.svg',
      width: 20,
      height: 20,
    );
  }
}
