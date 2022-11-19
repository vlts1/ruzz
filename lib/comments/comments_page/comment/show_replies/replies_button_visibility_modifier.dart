import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../../../../firebase/replies/replies_line_retriever.dart';
import '../../../../providers/replies/replies_visibility.dart';

class RepliesButtonVisibilityModifier {
  RepliesButtonVisibilityModifier(this.context);
  final BuildContext context;
  late RepliesVisibility repliesVisibility = Provider.of<RepliesVisibility>(
    context,
    listen: false,
  );

  void switchRepliesVisibility(String commentId) {
    final repliesLineRetriever = RepliesLineRetriever(commentId);

    repliesLineRetriever.load(context);
    if (repliesVisibility.isVisible(commentId)) {
      repliesVisibility.setHidden(commentId);
    }
    else {
      repliesVisibility.setVisible(commentId);
    }
  }
}
