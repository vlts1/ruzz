import 'package:flutter/cupertino.dart';
import '../../../themes/system_text_color.dart';
import '../../../themes/system_text_size.dart';

class CommentPreviewBody extends StatelessWidget {
  const CommentPreviewBody(this.bodyText, {Key? key}) : super(key: key);
  final String bodyText;
  @override
  Widget build(BuildContext context) {
    return Text(
      bodyText,
      style: TextStyle(
        fontSize: SystemTextSize.fromPlatform(context) - 1,
        color: SystemTextColor.getColor(context),
      ),
    );
  }
}
