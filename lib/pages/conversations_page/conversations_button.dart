import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/conversations_page/i_new_replies_awareness.dart';
import 'package:ruzz/pages/conversations_page/new_replies_awareness.dart';
import 'package:ruzz/themes/icons/new_messages/seen_messages/old_messages_icon.dart';
import 'package:ruzz/themes/icons/new_messages/unseen_messages/usneen_messages_icon.dart';
import '../../providers/current_user_info.dart';
import '../../providers/replies/loaded_replies.dart';
import '../home_page/updates_page/app_bar/new_page_navigation_button.dart';
import 'conversations_page.dart';

class ConversationsButton extends StatefulWidget {
  const ConversationsButton({super.key});

  @override
  State<ConversationsButton> createState() => _ConversationsButtonState();
}

class _ConversationsButtonState extends State<ConversationsButton> {
  late CurrentUserInfo currentUserInfo;
  late LoadedReplies loadedReplies;

  @override
  void didChangeDependencies() {
    currentUserInfo = Provider.of<CurrentUserInfo>(context);
    loadedReplies = Provider.of<LoadedReplies>(context);
    super.didChangeDependencies();
  }

  final noNewMessagesIcon = NewPageNavigationButton(
    destination: ConversationsPage.route,
    icon: OldMessagesIcon(),
  );

  final newMessagesAvailableIcon = NewPageNavigationButton(
    destination: ConversationsPage.route,
    icon: UnseenMessagesIcon(),
  );

  @override
  Widget build(BuildContext context) {
    final INewRepliesAwareness newRepliesAwareness = NewRepliesAwareness(
      loadedReplies.replies,
      currentUserInfo.checkedConversationsOn,
      currentUserInfo.docId,
    );

    return newRepliesAwareness.userHasUnseenReplies()
        ? newMessagesAvailableIcon
        : noNewMessagesIcon;
  }
}
