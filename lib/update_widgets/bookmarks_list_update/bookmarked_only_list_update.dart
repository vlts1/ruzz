import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/continue_to_comments.dart';
import 'package:ruzz/local_db/release.dart';
import 'package:ruzz/local_db/technology_logotypes.dart';
import 'package:ruzz/update_widgets/bookmarks_list_update/remove_bookmark_button/remove_bookmark_button.dart';
import 'package:ruzz/update_widgets/in_list_update/continue_to_update/continue_to_full_update.dart';
import 'package:ruzz/update_widgets/in_list_update/continue_to_update/continue_to_summary.dart';
import '../../../../update_widgets/in_list_update/header_box/header_box.dart';
import '../../../../update_widgets/in_list_update/technology_update_info/technology_logo.dart';
import '../../../../update_widgets/in_list_update/technology_update_info/version_technology.dart';
import '../../comments/comments_page/comments_navigator.dart';
import '../../providers/bookmarks.dart';

class BookmarkedOnlyListUpdate extends StatefulWidget {
  const BookmarkedOnlyListUpdate({
    required this.release,
    Key? key,
  }) : super(key: key);

  final Release release;

  @override
  State<BookmarkedOnlyListUpdate> createState() => _BookmarkedOnlyListUpdateState();
}

class _BookmarkedOnlyListUpdateState extends State<BookmarkedOnlyListUpdate> {
  late final commentNavigator = CommentsNavigator(
    widget.release.technology,
    widget.release.version,
  );
  final logos = TechnologyLogotypes();
  late Bookmarks _bookmarksProvider;

  @override
  void didChangeDependencies() {
    _bookmarksProvider = Provider.of<Bookmarks>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderBox(
          technology: widget.release.technology,
          releaseTitles: VersionTechnology(
            technologyName: widget.release.technology,
            versionNumber: widget.release.version,
          ),
          bookmarkVersion: RemoveBookmarkButton(
            onRemoveCallback: () {
              _bookmarksProvider.removeBookmark(widget.release);
            },
          ),
          logo: TechnologyLogo(
            logoImage: logos.logoOf(widget.release.technology),
          ),
          continueToComments: ContinueToComments(
            openComments: () {
              commentNavigator.openComments(context);
            },
          ),
          continueToFullUpdate: ContinueToFullUpdate(
            widget.release.technology,
            widget.release.version,
            link:  widget.release.docsLink,
          ),
          continueToSummary: ContinueToSummary(
            widget.release.technology,
            widget.release.version,
            link:  widget.release.summaryLink,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
