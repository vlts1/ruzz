import 'package:flutter/cupertino.dart';

class BookmarkRemovalConfirmationDialogIOS extends StatelessWidget {
  const BookmarkRemovalConfirmationDialogIOS({
    required this.onRemoveCallback,
    Key? key,
  }) : super(key: key);

  final Function() onRemoveCallback;
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: const Text(
        'Remove selected update from Bookmarks?',
      ),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          child: const Text("Yes"),
          onPressed: () {
            onRemoveCallback();
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: const Text("No"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
