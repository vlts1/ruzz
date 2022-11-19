import 'package:flutter/material.dart';
import 'package:ruzz/comments/comments_page/comments_refresher.dart';
import 'package:ruzz/pages/page_refresh_indicator.dart';
import '../text_editors/comment_editor.dart';

class CommentsPageMaterialScaffold extends StatelessWidget {
  const CommentsPageMaterialScaffold({
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
    return Scaffold(
      appBar: AppBar(
        title: Text("${technology} ${version}"),
        centerTitle: true,
        actions: [ CommentEditor(technology: technology, version: version) ],
      ),
      body: PageRefreshIndicator(
        onRefresh: () async {
          await commentsRefresher.refreshComments(technology, version);
        },
        child: body,
      ),
    );
  }
}
