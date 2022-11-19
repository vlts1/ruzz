import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/conversations_page/conversation_preview/conversation_widget.dart';
import 'package:ruzz/pages/conversations_page/conversations_refresher.dart';
import 'package:ruzz/pages/conversations_page/friendly_no_conversations_message.dart';
import 'package:ruzz/pages/conversations_page/latest_conversations_activity_date.dart';
import 'package:ruzz/pages/conversations_page/list_separators/conversations_separator.dart';
import 'package:ruzz/pages/conversations_page/scaffolds/conversations_page_scaffold.dart';
import 'package:ruzz/pages/page_refresh_indicator.dart';
import 'package:ruzz/providers/comments/loaded_comments.dart';
import 'package:ruzz/providers/current_user_info.dart';
import 'package:ruzz/providers/replies/loaded_replies.dart';

class ConversationsPage extends StatefulWidget {
  const ConversationsPage({super.key});
  static const route = '/conversations';
  @override
  State<ConversationsPage> createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {
  late CurrentUserInfo currentUserInfo;
  final conversationsRefresher = ConversationsRefresher();
  late final DateTime lastCheckedConversationsDate;
  late LoadedComments loadedComments;

  @override
  void initState() {
    final oneTimeUserInfoProvider = Provider.of<CurrentUserInfo>(context, listen: false);
    lastCheckedConversationsDate = oneTimeUserInfoProvider.checkedConversationsOn;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    currentUserInfo = Provider.of<CurrentUserInfo>(context);
    loadedComments  = Provider.of<LoadedComments> (context);
    final latestConversationCommentDate = LatestConversationsActivityDate(
      currentUserInfo.myConversations, 
      loadedComments, 
      Provider.of<LoadedReplies>(context, listen: false),
    );
    if (currentUserInfo.myConversations.isNotEmpty) {
      currentUserInfo.updateLastCheckedConversationsOn(
        latestConversationCommentDate.date,
      );
    }
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    debugPrint('ConversationsPage: last checked conversations on:' + currentUserInfo.checkedConversationsOn.toString());

    return ConversationsPageScaffold(
      body: PageRefreshIndicator(
        onRefresh: () async {
          await conversationsRefresher.refresh(
            context, 
            currentUserInfo.myConversations,
          ); 
          final latestConversationCommentDate = LatestConversationsActivityDate(
            currentUserInfo.myConversations, 
            loadedComments, 
            Provider.of<LoadedReplies>(context, listen: false),
          );
          if (currentUserInfo.myConversations.isNotEmpty) {
            currentUserInfo.updateLastCheckedConversationsOn(
              latestConversationCommentDate.date,
            );
          }
        },
        child: currentUserInfo.myConversations.isNotEmpty ? ListView.separated(
          physics: AlwaysScrollableScrollPhysics(),
          itemCount: currentUserInfo.myConversations.length,
          itemBuilder: (context, index) {
            return ConversationWidget    (index, lastCheckedConversationsDate);
          },
          separatorBuilder: (context, index) {
            return ConversationsSeparator(index, lastCheckedConversationsDate);
          },
        ) : FriendlyNoConversationsMessage(),
      ),
    );
  }
}
