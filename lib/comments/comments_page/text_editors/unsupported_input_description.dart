import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/text_editors/max_allowed_comment_length.dart';
import 'package:ruzz/providers/editing_comment.dart';
import 'package:ruzz/themes/system_text_color.dart';

class UnsupportedInputDescription extends StatefulWidget {
  const UnsupportedInputDescription({Key? key}) : super(key: key);

  @override
  State<UnsupportedInputDescription> createState() => _UnsupportedInputDescriptionState();
}

class _UnsupportedInputDescriptionState extends State<UnsupportedInputDescription> {
  final maxAllowedCommentLength = MaxAllowedCommentLength();
  late EditingComment editingCommentProvider;

  @override
  void didChangeDependencies() {
    editingCommentProvider = Provider.of<EditingComment>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final commentLen = editingCommentProvider.comment.length;
    final linesCount = '\n'.allMatches(editingCommentProvider.comment).length + 1;
    if (commentLen > maxAllowedCommentLength.charLimit || linesCount > 50) {
      return Text(
        "Comment's length exceeds the limit", 
        style: TextStyle(color: SystemTextColor.getColor(context)),
      );
    } 
    return const Text(" ");
  }
}
