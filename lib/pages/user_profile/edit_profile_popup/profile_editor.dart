import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/user_info/user_info_full_page/circular_image_decoration.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/name_editor_text_field/new_name_text_field.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/done_button/profile_editing_done_button.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/profile_image/choose_image_from_gallery_button.dart';
import 'package:ruzz/providers/editing_profile.dart';
import 'package:ruzz/themes/colors/i_platform_color.dart';
import 'package:ruzz/themes/colors/page_background_color.dart';

class ProfileEditor extends StatefulWidget {
  const ProfileEditor({Key? key}) : super(key: key);

  @override
  State<ProfileEditor> createState() => _ProfileEditorState();
}

class _ProfileEditorState extends State<ProfileEditor> {
  final IPlatformColor backgroundColor = PageBackgroundColor();
  late EditingProfile editingProfileProvider;

  @override
  void didChangeDependencies() {
    editingProfileProvider = Provider.of<EditingProfile>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom - 100;
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 75),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft:  Radius.circular(18),
            topRight: Radius.circular(18),
          ),
          color: backgroundColor.fromTheme(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox(height: 50),
            Container(
              height: 100,
              width:  100,
              decoration: CircularImageDecoration(editingProfileProvider.userLogo),
            ),
            const ChooseImageFromGalleryButton(),
            const SizedBox(height: 20),
            const NewNameTextField(),
            SizedBox(height: bottomPadding < 100 ? 100 : bottomPadding),
            const ProfileEditingDoneButton(),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
