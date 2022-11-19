import 'dart:io';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ruzz/themes/icons/gallery/android_gallery_icon.dart';
import 'package:ruzz/themes/icons/gallery/ios_gallery_icon.dart';

class GalleryIcon extends StatelessWidget {
  const GalleryIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? const IosGalleryIcon() : const AndroidGalleryIcon();
  }
}
