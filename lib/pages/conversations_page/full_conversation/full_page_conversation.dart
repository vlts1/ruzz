import 'package:flutter/cupertino.dart';
import 'package:ruzz/comments/comments_page/comment/comment_data.dart';
import 'package:ruzz/comments/comments_page/comment/comment_padding.dart';
import 'package:ruzz/pages/conversations_page/full_conversation/full_conversation_widget.dart';
import 'package:ruzz/pages/conversations_page/full_conversation/full_page_conversation_scaffold.dart';

class FullPageConversation extends StatefulWidget {
  const FullPageConversation({super.key});
  static const route = '/full-page-conversation';

  @override
  State<FullPageConversation> createState() => _FullPageConversationState();
}

class _FullPageConversationState extends State<FullPageConversation> {
  late final commentData = ModalRoute.of(context)!.settings.arguments as CommentData;
  @override
  Widget build(BuildContext context) {
    return FullPageConversationScaffold(
      body: Padding(
        padding: CommentPadding().edgeInsets,
        child: SingleChildScrollView(
          
          physics: AlwaysScrollableScrollPhysics(),
          child:   FullConversationWidget(commentData),
        ),
      ),
      technology:  commentData.updateInfo.technology,
      version:     commentData.updateInfo.version,
    );
  }
}
