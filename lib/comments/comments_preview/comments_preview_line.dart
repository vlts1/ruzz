import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/comment/update_info.dart';
import 'package:ruzz/comments/comments_preview/comments_previews_builder.dart';
import 'package:ruzz/firebase/comments/builder/comments_line_retriever.dart';
import 'package:ruzz/pages/pages_scaffold.dart';
import 'package:ruzz/providers/comments/comment_preview_positions.dart';
import 'package:ruzz/providers/comments/comments_loading_status.dart';
import 'package:ruzz/providers/comments/loaded_comments.dart';
import '../comments_page/comment/comment_data.dart';
import 'comment_preview.dart';

class CommentsPreviewLine extends StatefulWidget {
  const CommentsPreviewLine(
    this.technology,
    this.version, {
    required this.onCommentScrolled,
    Key? key,
  }) : super(key: key);

  final String technology;
  final String version;
  final void Function(int id) onCommentScrolled;
  @override
  State<CommentsPreviewLine> createState() => _CommentsPreviewLineState();
}

class _CommentsPreviewLineState extends State<CommentsPreviewLine> {
  late List<CommentData> comments;

  late       CommentsLoadingStatus   commentsLoadingStatus;
  late final CommentsLineRetriever   commentsLineRetriever;
  late       CommentPreviewPositions commentPreviewPositions;

  late final commentsBuilder = CommentsPreviewsBuilder(
    commentsLineRetriever,
    commentsLoadingStatus,
    widget.technology,
    widget.version,
  );

  @override
  void initState() {
    commentsLineRetriever = CommentsLineRetriever(
      widget.technology,
      widget.version,
      PagesScaffold.scaffoldKey.currentContext!,
    );
    commentsLineRetriever.loadMore();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    comments = Provider.of<LoadedComments>(context).getCommentsFromUpdate(
      UpdateInfo(widget.technology, widget.version),
    );
    commentsLoadingStatus   = Provider.of<CommentsLoadingStatus>  (context);
    commentPreviewPositions = Provider.of<CommentPreviewPositions>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty) return const SizedBox.shrink();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: CommentPreview.height),
      child: PageView.builder(
        controller: PageController(
          initialPage: commentPreviewPositions.getVisiblePreview(
            widget.technology, 
            widget.version,
          ),
        ),
        physics:   AlwaysScrollableScrollPhysics(),
        itemCount: comments.length,

        onPageChanged: (int page) {
          commentPreviewPositions.setVisiblePreview(
            widget.technology, 
            widget.version, 
            page,
          );
          widget.onCommentScrolled(page);
        },

        itemBuilder: (context, index) { 
          return commentsBuilder.itemBuilder(context, index, comments); 
        },
      ),
    );
  }
}