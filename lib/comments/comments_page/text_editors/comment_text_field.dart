import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/providers/editing_comment.dart';

class CommentTextField extends StatefulWidget {
  const CommentTextField({Key? key}) : super(key: key);

  @override
  State<CommentTextField> createState() => _CommentTextFieldState();
}

class _CommentTextFieldState extends State<CommentTextField> {
  String comment = "";
  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      onChanged: (String field) {
        Provider.of<EditingComment>(context, listen: false).comment = field;
      },
      padding: const EdgeInsets.all(15),
      minLines: 9,
      maxLines: 9,
      placeholder: "Write your comment here...",
    );
  }
}
