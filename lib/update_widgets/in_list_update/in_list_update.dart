import 'package:flutter/cupertino.dart';
import 'package:ruzz/comments/comments_page/comments_navigator.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/continue_to_comments.dart';
import 'package:ruzz/comments/comments_preview/comments_preview_line.dart';
import 'package:ruzz/update_widgets/in_list_update/bookmark/bookmark_update.dart';
import 'package:ruzz/update_widgets/in_list_update/continue_to_update/continue_to_full_update.dart';
import 'package:ruzz/update_widgets/in_list_update/continue_to_update/continue_to_summary.dart';
import 'package:ruzz/update_widgets/in_list_update/header_box/header_box.dart';
import 'package:ruzz/update_widgets/in_list_update/technology_update_info/version_technology.dart';
import 'package:ruzz/update_widgets/in_list_update/technology_update_info/technology_logo.dart';
import '../../local_db/release.dart';
import '../../local_db/technology_logotypes.dart';
import 'in_list_divider/in_list_technology_divider.dart';

class InListUpdate extends StatefulWidget {
  const InListUpdate({required this.release, Key? key}) : super(key: key);
  final Release release;

  @override
  State<InListUpdate> createState() => InListUpdateState();
}

class InListUpdateState extends State<InListUpdate> {
  final logos = TechnologyLogotypes();
  late final commentNavigator = CommentsNavigator(
    widget.release.technology,
    widget.release.version,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderBox(
          technology: widget.release.technology,
          continueToFullUpdate: ContinueToFullUpdate(
            widget.release.technology,
            widget.release.version,
            link:  widget.release.docsLink,
          ),
          continueToComments: ContinueToComments(
            openComments: () { commentNavigator.openComments(context); },
          ),
          continueToSummary: ContinueToSummary(
            widget.release.technology,
            widget.release.version,
            link:  widget.release.summaryLink,
          ),
          releaseTitles: VersionTechnology(
            technologyName: widget.release.technology,
            versionNumber:  widget.release.version,
          ),
          bookmarkVersion: BookmarkUpdate(release: widget.release),
          logo: TechnologyLogo(
            logoImage: logos.logoOf(widget.release.technology),
          ),
        ),
        CommentsPreviewLine(
          widget.release.technology,
          widget.release.version,
          onCommentScrolled: (id) {
            setState(() { commentNavigator.previewedComment = id; });
          },
        ),
        const InListTechnologyDivider(),
      ],
    );
  }
}