import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ruzz/update_widgets/bookmarks_list_update/remove_bookmark_button/bookmark_removal_confirmation_dialog_ios.dart';
import 'package:ruzz/update_widgets/bookmarks_list_update/remove_bookmark_button/remove_bookmark_icon_ios.dart';
import 'package:ruzz/update_widgets/bookmarks_list_update/remove_bookmark_button/remove_bookmark_icon_android.dart';

import 'bookmark_removal_confirmation_dialog_android.dart';

class RemoveBookmarkButton extends StatelessWidget {
  const RemoveBookmarkButton({
    required this.onRemoveCallback,
    Key? key,
  }) : super(key: key);
  final Function() onRemoveCallback;
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            onPressed: () {
              HapticFeedback.lightImpact();
              showCupertinoDialog(
                context: context,
                builder: (context) {
                  return BookmarkRemovalConfirmationDialogIOS(
                    onRemoveCallback: onRemoveCallback,
                  );
                },
              );
            },
            child: const RemoveBookmarkIconIos(),
          )
        : TextButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              showDialog(
                context: context,
                builder: (context) {
                  return BookmarkRemovalConfirmationDialogAndroid(
                    onRemoveCallback: onRemoveCallback,
                  );
                },
              );
            },
            child: RemoveBookmarkIconAndroid(),
          );
  }
}
