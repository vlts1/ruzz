import 'package:flutter/cupertino.dart';
import 'package:ruzz/comments/comments_page/comments_navigator.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/continue_to_comments.dart';
import 'package:ruzz/comments/comments_preview/comments_preview_line.dart';
import 'package:ruzz/update_widgets/in_list_update/bookmark/bookmark_update.dart';
import 'package:ruzz/update_widgets/in_list_update/continue_to_update/continue_to_full_update.dart';
import 'package:ruzz/update_widgets/in_list_update/continue_to_update/continue_to_summary.dart';
import 'package:ruzz/update_widgets/in_list_update/header_box/header_box.dart';
import 'package:ruzz/update_widgets/in_list_update/technology_update_info/technology_logo.dart';
import '../../local_db/release.dart';
import '../../local_db/technology_logotypes.dart';
import '../in_list_update/in_list_divider/in_list_technology_divider.dart';
import 'version_date.dart';

class TechnologyPageUpdate extends StatefulWidget {
  const TechnologyPageUpdate({required this.release, Key? key}) : super(key: key);
  final Release release;

  @override
  State<TechnologyPageUpdate> createState() => InListUpdateState();
}

class InListUpdateState extends State<TechnologyPageUpdate> {
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
            link: widget.release.docsLink,
          ),
          continueToComments: ContinueToComments(
            openComments: () {
              commentNavigator.openComments(context);
            },
          ),
          continueToSummary: ContinueToSummary(
            widget.release.technology,
            widget.release.version,
            link: widget.release.summaryLink,
          ),
          releaseTitles: VersionDate(
            versionNumber:     widget.release.version,
            ruzzDbReleaseDate: widget.release.releaseDate,
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
