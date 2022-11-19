import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/comments_builder.dart';
import 'package:ruzz/comments/comments_page/comments_refresher.dart';
import 'package:ruzz/comments/comments_page/scaffolds/comments_page_cupertino_scaffold.dart';
import 'package:ruzz/comments/comments_page/scaffolds/comments_page_material_scaffold.dart';
import 'package:ruzz/firebase/comments/builder/comments_line_retriever.dart';
import 'package:ruzz/providers/comments/comments_loading_status.dart';
import 'package:ruzz/providers/comments/loaded_comments.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage(
    this.technology,
    this.version, {
    required this.controller,
    required this.commentsLineRetriever,
    Key? key,
  }) : super(key: key);

  final String technology;
  final String version;
  final AutoScrollController  controller;
  final CommentsLineRetriever commentsLineRetriever;

  static const route = "/comments";
  @override
  State<CommentsPage> createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  late LoadedComments        commentsProvider;
  late CommentsLoadingStatus commentsLoadingStatus;
  late CommentsBuilder       commentsBuilder;
  late final commentsRefresher = CommentsRefresher(context);

  @override
  void initState() {
    widget.commentsLineRetriever.loadMore();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    commentsProvider      = Provider.of<LoadedComments>(context);
    commentsLoadingStatus = Provider.of<CommentsLoadingStatus>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    commentsBuilder = CommentsBuilder(
      context,
      widget.controller,
      widget.technology,
      widget.version,
      widget.commentsLineRetriever,
    );

    return Platform.isIOS
        ? CommentsPageCupertinoScaffold(
            technology: widget.technology,
            version:    widget.version,
            body:       commentsBuilder.loadComments(),
          )
        : CommentsPageMaterialScaffold(
            technology: widget.technology,
            version:    widget.version,
            body:       commentsBuilder.loadComments(),
          );
  }
}
