import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/likes_count/likes_count_body.dart';
import '../../../../providers/comments/loaded_comments.dart';
import '../../../../themes/icons/thumbs_up/ignored/thumbs_up_icon.dart';
import '../../../../themes/icons/thumbs_up/liked/thumbs_up_icon_selected.dart';
import 'i_likes_count_retriever.dart';

class LikesCount extends StatefulWidget {
  const LikesCount({required this.likesCountRetriever, super.key});
  final ILikesCountRetriever likesCountRetriever;

  @override
  State<LikesCount> createState() => _LikesCountState();
}

class _LikesCountState extends State<LikesCount> {
  late String likesCount = widget.likesCountRetriever.likesCount().toString();

  late Widget icon = widget.likesCountRetriever.isSelected
      ? icon = const ThumbsUpIconSelected()
      : icon = const ThumbsUpIcon();

  Future<void> setCount() async {
    setState(() {
      likesCount = widget.likesCountRetriever.likesCount().toString();
      widget.likesCountRetriever.isSelected
          ? icon = const ThumbsUpIconSelected()
          : icon = const ThumbsUpIcon();
    });
  }

  late LoadedComments commentsProvider;

  @override
  void didChangeDependencies() {
    commentsProvider = Provider.of<LoadedComments>(context);
    setCount();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: LikesCountBody(count: likesCount, icon: icon),
      onTap: () {
        HapticFeedback.selectionClick();
        widget.likesCountRetriever.switchSelection();
        commentsProvider.updateLikesCount();
        setCount();
      },
    );
  }
}
