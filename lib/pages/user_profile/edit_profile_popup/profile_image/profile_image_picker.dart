import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/error_messages/image_upload_error.dart';
import 'package:ruzz/providers/editing_profile.dart';

class ProfileImagePicker {
  final _imagePicker = ImagePicker();
  void pickImage(BuildContext context) async {
    final editingProfileProvider = Provider.of<EditingProfile> (context, listen: false);
    XFile? file;
    try {
      file = await _imagePicker.pickImage(source: ImageSource.gallery);
      debugPrint('picked an image');
    } catch (e) {
      debugPrint('caught an error');
      showCupertinoDialog(
        context: context,
        builder: (context) {
          return ImageUploadError(context);
        },
      );
    }
    // If null, user probably quit the gallery preview
    debugPrint('checking for null');
    if (file != null) {
      final byteImage = await file.readAsBytes();
      editingProfileProvider.setUserLogo(byteImage);
      debugPrint('set user logo');
    }
  }
}
