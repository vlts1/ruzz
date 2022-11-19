import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/conversations_page/converations_list/conversations_ordered_list.dart';
import 'package:ruzz/providers/comments/old_new_conversations_separation.dart';
import '../../../comments/comments_page/comment/comment_separator.dart';
import '../../../providers/replies/loaded_replies.dart';
import 'old_conversations_separator.dart';

class ConversationsSeparator extends StatefulWidget {
  const ConversationsSeparator(this.currentIndex, this.lastcheckedOn, {super.key});
  final int      currentIndex;
  final DateTime lastcheckedOn;
  @override
  State<ConversationsSeparator> createState() => _ConversationsSeparatorState();
}

class _ConversationsSeparatorState extends State<ConversationsSeparator> {
  late OldNewConversationsSeparation oldNewConversationsSeparation;
  final conversationsList = ConversationsOrderedList();
  @override
  void didChangeDependencies() {
    oldNewConversationsSeparation = Provider.of<OldNewConversationsSeparation>(context);

    conversationsList.newList(context, widget.lastcheckedOn);
    Provider.of<LoadedReplies>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (oldNewConversationsSeparation.separationIndex == widget.currentIndex) {
      return OldConversationsSeparator();
    }
    else return CommentSeparator();
  }
}
