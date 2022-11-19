import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/pages/conversations_page/conversations_button.dart';
import 'package:ruzz/pages/home_page/bookmarks_page.dart';
import 'package:ruzz/pages/home_page/tracked_page/tracked_page.dart';
import 'package:ruzz/pages/home_page/updates_page/app_bar/animated_transitioning_text.dart';
import 'package:ruzz/pages/home_page/updates_page/app_bar/new_page_navigation_button.dart';
import 'package:ruzz/themes/icons/bookmarks/bookmarks_page_icon.dart';
import 'package:ruzz/themes/icons/my_technologies/my_technologies_icon.dart';

class UpdatesPageAppBar extends StatefulWidget with ObstructingPreferredSizeWidget {
  UpdatesPageAppBar({required this.title, Key? key}) : super(key: key);
  final String title;

  /// 16 is the default value in source code, unfortunately unmodifiable.
  static const navBarEdgePadding = 17.0;
  @override
  State<UpdatesPageAppBar> createState() => UpdatesPageAppBarState();

  @override
  Size get preferredSize => const CupertinoNavigationBar().preferredSize;

  @override
  bool shouldFullyObstruct(BuildContext context) => false;
}

class UpdatesPageAppBarState extends State<UpdatesPageAppBar> {
  final myTechnologies = NewPageNavigationButton(
    destination: TrackedPage.route,
    icon:        MyTechnologiesIcon(),
  );
  final bookmarks = NewPageNavigationButton(
    destination: BookmarksPage.route,
    icon:        BookmarksPageIcon(),
  );
  final messages = const ConversationsButton();

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoNavigationBar(
            leading: Row(
              mainAxisSize: MainAxisSize.min,
              children: [myTechnologies, SizedBox(width: 12), bookmarks],
            ),
            middle: AnimatedTransitioningText(widget.title),
            trailing: messages,
          )
        : AppBar(
            leading: messages,
            centerTitle: true,
            backgroundColor: Theme.of(context).bottomAppBarColor,
            title: AnimatedTransitioningText(widget.title),
            actions: [bookmarks, myTechnologies],
          );
  }
}
