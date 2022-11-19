import 'package:flutter/cupertino.dart';
import 'package:ruzz/pages/page_refresh_indicator.dart';

import '../comments_refresher.dart';
import '../text_editors/comment_editor.dart';

class CommentsPageCupertinoScaffold extends StatelessWidget {
  const CommentsPageCupertinoScaffold({
    super.key,
    required this.body,
    required this.technology,
    required this.version,
  });
  final Widget body;
  final String technology;
  final String version;
  @override
  Widget build(BuildContext context) {
    final commentsRefresher = CommentsRefresher(context);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        previousPageTitle: "Updates",
        middle: Text("${technology} ${version}"),
        trailing: CommentEditor(
          technology: technology,
          version: version,
        ),
      ),
      child: PageRefreshIndicator(
        onRefresh: () async {
          await commentsRefresher.refreshComments(technology, version);
        },
        child: body,
      ),
    );
  }
}
