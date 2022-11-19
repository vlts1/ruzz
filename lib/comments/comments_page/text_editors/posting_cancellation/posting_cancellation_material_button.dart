import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'editor_closer.dart';

class PostingCancellationMaterialButton extends StatelessWidget {
  const PostingCancellationMaterialButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _editorCloser = EditorCloser(context);
    return TextButton(
      child: const Text(
        "Discard",
        style: TextStyle(color: CupertinoColors.destructiveRed),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title:   const Text("Exit Comment Editor?"),
              content: const Text("Comment draft will not be saved."),
              actions: [

                TextButton(
                  child: const Text("Stay"),
                  onPressed: Navigator.of(context).pop,
                ),

                TextButton(
                  child: const Text(
                    "Exit",
                    style: TextStyle(color: CupertinoColors.destructiveRed),
                  ),
                  onPressed: _editorCloser.quitEditor,
                ),

              ],
            );
          },
        );
      },
    );
  }
}
