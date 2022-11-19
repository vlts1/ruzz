import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:ruzz/comments/comments_preview/comment_preview/continue_to_comments.dart';
import 'package:ruzz/pages/home_page/updates_page/app_bar/updates_page_app_bar.dart';
import 'package:ruzz/pages/technology_releases_page/technology_releases_page.dart';
import 'package:ruzz/update_widgets/in_list_update/continue_to_update/continue_to_full_update.dart';
import 'package:ruzz/update_widgets/in_list_update/continue_to_update/continue_to_summary.dart';
import 'package:ruzz/update_widgets/in_list_update/header_box/header_box_vertical_pair.dart';
import 'package:ruzz/update_widgets/in_list_update/header_box/header_decorator.dart';
import 'package:ruzz/update_widgets/in_list_update/technology_update_info/technology_logo.dart';

class HeaderBox extends StatelessWidget {
  HeaderBox({
    required this.releaseTitles,
    required this.bookmarkVersion,
    required this.logo,
    required this.continueToComments,
    required this.continueToFullUpdate,
    required this.continueToSummary,
    required this.technology,
    Key? key,
  }) : super(key: key);

  final Widget               releaseTitles;
  final Widget               bookmarkVersion;
  final TechnologyLogo       logo;
  final ContinueToComments   continueToComments;
  final ContinueToFullUpdate continueToFullUpdate;
  final ContinueToSummary    continueToSummary;
  final String               technology;

  final _decoration = HeaderDecorator();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ModalRoute.of(context)?.settings.name == TechnologyReleasesPage.route) return;
        Navigator.of(context).pushNamed(
          TechnologyReleasesPage.route,
          arguments: technology,
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          top:    4,
          bottom: 6,
          left:   UpdatesPageAppBar.navBarEdgePadding,
          right:  UpdatesPageAppBar.navBarEdgePadding,
        ),
        padding: EdgeInsets.only(top: 16, bottom: Platform.isIOS ? 12 : 0),
        decoration: _decoration.boxDecoration(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: HeaderBoxVerticalPair(logo,            continueToComments  )),
            Expanded(child: HeaderBoxVerticalPair(releaseTitles,   continueToFullUpdate)),
            Expanded(child: HeaderBoxVerticalPair(bookmarkVersion, continueToSummary   )),
          ],
        ),
      ),
    );
  }
}
