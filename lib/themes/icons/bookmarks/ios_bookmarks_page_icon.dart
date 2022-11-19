import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class IosBookmarksPageIcon extends StatelessWidget {
  const IosBookmarksPageIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'images/ios-bookmarks-icon.svg',
      width: 21.5,
      height: 21.5,
    );
  }
}
