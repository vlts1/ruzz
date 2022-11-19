import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/profile_image/profile_image_picker.dart';
import 'package:ruzz/themes/icons/gallery/gallery_icon.dart';

class ChooseImageFromGalleryButton extends StatefulWidget {
  const ChooseImageFromGalleryButton({Key? key}) : super(key: key);

  @override
  State<ChooseImageFromGalleryButton> createState() => _ChooseImageFromGalleryButtonState();
}

class _ChooseImageFromGalleryButtonState extends State<ChooseImageFromGalleryButton> {
  final ProfileImagePicker profileImage = ProfileImagePicker();

  final buttonText = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [ Text("Open Gallery "), GalleryIcon() ],
  );
  
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
      ? CupertinoButton(
          child: buttonText,
          onPressed: () { profileImage.pickImage(context); },
        )
      : TextButton(
          onPressed: () { profileImage.pickImage(context); },
          child: buttonText,
        );
  }
}
