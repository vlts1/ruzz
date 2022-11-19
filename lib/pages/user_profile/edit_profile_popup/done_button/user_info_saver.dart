import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/firebase/images/profile_pic_firebase_storage_modifier.dart';
import 'package:ruzz/firebase/profile/comments_name_changer.dart';
import 'package:ruzz/firebase/profile/profile_name_changer.dart';
import 'package:ruzz/providers/replies/loaded_replies.dart';
import '../../../../providers/current_user_info.dart';
import '../../../../providers/editing_profile.dart';
import '../error_handlers/name_input_error_handler.dart';

class UserInfoSaver {
  UserInfoSaver(this.context, this.editingProfileProvider, this.currentUserInfoProvider);
  final EditingProfile  editingProfileProvider;
  final CurrentUserInfo currentUserInfoProvider;
  final BuildContext context;
  final _nameInputErrorHandler = NameInputErrorHandler();
  final _dbNameChanger         = ProfileNameChanger();
  late final _commentsNameChanger = CommentsNameChanger(
    currentUserInfoProvider, 
    Provider.of<LoadedReplies>(context, listen: false),
  );


  bool saveEditedInfo() {
    final profilePicModifier = ProfilePicFirebaseStorageModifier(context);

    debugPrint('input: ' + editingProfileProvider.userName);
    final bool isInputCorrect = !_nameInputErrorHandler.didHandleUnsupportedInput(
      editingProfileProvider.userName,
      context,
    );

    if (isInputCorrect) {
      if (currentUserInfoProvider.fullName != editingProfileProvider.userName) {
        currentUserInfoProvider.fullName = editingProfileProvider.userName;
        _dbNameChanger.changeUserName(
          currentUserInfoProvider.fullName,
          currentUserInfoProvider.docId,
        );
        _commentsNameChanger.changeNameInComments(currentUserInfoProvider.fullName);
      }
      if (currentUserInfoProvider.logo != editingProfileProvider.userLogo) {
        currentUserInfoProvider.logo = editingProfileProvider.userLogo;
        profilePicModifier.setProfilePic(editingProfileProvider.logoAsBytes);
      }
      return true;
    }
    return false;
  }
}