import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/firebase/profile/current_user_info_file_loader.dart';
import 'package:ruzz/providers/bookmarks.dart';
import 'firebase/comments/conversations/conversations_loader.dart';
import 'firebase/user_subscriptions/new_subscriptions_loader.dart';
import 'providers/latest_technology_versions.dart';

class StartupDataCollector {
  factory StartupDataCollector() {
    return _instance;
  }

  StartupDataCollector._internal();
  static final _instance = StartupDataCollector._internal();

  final _currentUserInfoFileLoader = CurrentUserInfoFileLoader();

  Future<void> loadStartupData(BuildContext context) async {
    final _myConversationsLoader    = ConversationsLoader   (context);
    final _newSubscriptionsLoader   = NewSubscriptionsLoader(context);
    final _bookmarksProvider        = Provider.of<Bookmarks>(
      context, listen: false
    );
    final _latestTechnologyVersions = Provider.of<LatestTechnologyVersions>(
      context,
      listen: false,
    );

    Future userInfo    = _currentUserInfoFileLoader .initCurrentUserInfo(context);
    Future newVersions = _latestTechnologyVersions  .fetchLatestVersions();
    await userInfo;

    Future bookmarks       = _bookmarksProvider     .fetchBookmarks();
    Future subs            = _newSubscriptionsLoader.saveUnsavedSubscriptions();
    Future myConversations = _myConversationsLoader .loadComments();

    await bookmarks;
    await newVersions;
    await subs;
    await myConversations;

    debugPrint('Loaded Startup data');
  }
}