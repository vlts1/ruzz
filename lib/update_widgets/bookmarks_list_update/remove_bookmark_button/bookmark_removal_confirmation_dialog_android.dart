import 'package:flutter/material.dart';

class BookmarkRemovalConfirmationDialogAndroid extends StatelessWidget {
  const BookmarkRemovalConfirmationDialogAndroid({
    required this.onRemoveCallback,
    Key? key,
  }) : super(key: key);

  final Function() onRemoveCallback;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Remove selected update from Bookmarks?',
      ),
      actions: [
        TextButton(
          child: const Text("Yes"),
          onPressed: () {
            onRemoveCallback();
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: const Text("No"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
