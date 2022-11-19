import 'package:flutter/cupertino.dart';
import 'package:ruzz/comments/comments_page/text_editors/posting_cancellation/editor_closer.dart';

class PostingCancellationCupertinoButton extends StatelessWidget {
  PostingCancellationCupertinoButton({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final _editorCloser = EditorCloser(context);
    return CupertinoButton(
      minSize: 0,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
      child: const Text(
        "Discard",
        style: TextStyle(color: CupertinoColors.destructiveRed),
      ),
      onPressed: () {
        showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title:   const Text("Exit Comment Editor?"),
              content: const Text("Comment draft will not be saved."),
              actions: [
                
                CupertinoDialogAction(
                  onPressed: _editorCloser.quitEditor,
                  child: const Text("Exit"),
                  isDestructiveAction: true,
                ),
                
                CupertinoDialogAction(
                  child: const Text("No"),
                  onPressed: Navigator.of(context).pop,
                ),

              ],
            );
          },
        );
      },
    );
  }
}
