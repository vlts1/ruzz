import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/loading_indicator.dart';
import 'package:ruzz/firebase/user_subscriptions/new_subscriptions_loader.dart';
import 'package:ruzz/local_db/ruzz_db.dart';
import 'package:ruzz/local_db/ruzz_db_date_to_date_time_adapter.dart';
import 'package:ruzz/pages/home_page/updates_page/app_bar_title_with_last_update_release_date/release_date_title_setter.dart';
import 'package:ruzz/pages/home_page/updates_page/friendly_no_subscriptions_message.dart';
import 'package:ruzz/pages/home_page/updates_page/release_date_group_divider/update_list_time_frame_divider/update_list_time_frame_divider.dart';
import 'package:ruzz/pages/home_page/updates_page/releases_sorter.dart';
import 'package:ruzz/pages/home_page/updates_page/update_keys/update_keys.dart';
import 'package:ruzz/pages/home_page/updates_page/update_keys/widget_with_key.dart';
import 'package:ruzz/pages/home_page/updates_page/app_bar/updates_page_app_bar.dart';
import 'package:ruzz/pages/page_refresh_indicator.dart';
import 'package:ruzz/update_widgets/in_list_update/in_list_update.dart';
import '../../../local_db/release.dart';
import '../../../providers/comments/comment_preview_positions.dart';

class UpdatesPage extends StatefulWidget {
  const UpdatesPage({required this.scrollController, super.key});
  static const defaultTitle = "Latest";
  final ScrollController scrollController;
  @override
  State<UpdatesPage> createState() => _UpdatesPageState();
}

class _UpdatesPageState extends State<UpdatesPage> {
  late String title = UpdatesPage.defaultTitle;
  final releasesSorter = ReleasesSorter();

  late       UpdateListTimeFrameDivider updatesSeparator;
  late final ReleaseDateTitleSetter     releaseDateTitleSetter;
  late final KeyAdder                   keyAdder;
  late final UpdateKeys                 keys;
             List<Release>?             releases;

  @override
  void initState() {
    RuzzDb.instance.latestReleases().then((loadedReleases) {
      ///! FIXME Meteor 2.8 broke fucking everything so now the db query doesn't sort
      /// the items correctly by itself.
      releasesSorter.sort(loadedReleases);
      setState(() { releases = loadedReleases; });
      debugPrint('updates page releases count: ' + releases!.length.toString());
    });

    updatesSeparator       = UpdateListTimeFrameDivider();
    releaseDateTitleSetter = ReleaseDateTitleSetter(
      controller: widget.scrollController,
      navigationBarHeight: const CupertinoNavigationBar().preferredSize.height,
      onTitleChangeCallback: (String newTitle) {
        setState(() { title = newTitle; });
      },
    );

    keys     = UpdateKeys();
    keyAdder = KeyAdder();

    super.initState();
  }

  Future<void> refreshSubscriptions() async {
    await NewSubscriptionsLoader(context).saveUnsavedSubscriptions();
    final latestSubs = await RuzzDb.instance.latestReleases();
    updatesSeparator = UpdateListTimeFrameDivider();  
    releasesSorter.sort(latestSubs);
    setState(() { releases = latestSubs; });
    Provider.of<CommentPreviewPositions>(context, listen: false).notifyPreviewsOfOrderChange();
  }

  @override
  Widget build(BuildContext context) {
    late final child = releases != null
        ? PageRefreshIndicator(
            onRefresh: refreshSubscriptions,
            child: releases?.length != 0 ? ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              controller: widget.scrollController,
              itemCount: releases?.length,
              itemBuilder: (context, index) {
                final update = updatesSeparator.updateWithTimeSeparator(
                  update:      InListUpdate(release: releases![index]),
                  index:       index,
                  releaseDate: RuzzDbDateToDateTimeAdapter(releases![index].releaseDate),
                );
            
                releaseDateTitleSetter.titleFromUpdateBehindAppBar(
                  updateWidgetKey: keys.getKey(index),
                  releaseDate:     RuzzDbDateToDateTimeAdapter(releases![index].releaseDate),
                  listIndex:       index,
                );
            
                return keyAdder.wrapWithKey(update, keys.getKey(index));
              },
            ) : FriendlyNoSubscriptionsMessage()
          )
        : LoadingIndicator();
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: UpdatesPageAppBar(title: title), 
            child: child,
          )
        : Scaffold(appBar: UpdatesPageAppBar(title: title), body: child);
  }
}