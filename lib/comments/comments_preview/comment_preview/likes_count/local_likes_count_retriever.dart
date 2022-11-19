import 'package:ruzz/comments/comments_preview/comment_preview/likes_count/i_likes_count_retriever.dart';

class LocalLikesCountRetriever implements ILikesCountRetriever {
  bool _isLiked = false;

  @override
  Future<void> init() async {
    return;
  }

  @override
  bool get isSelected => _isLiked;

  @override
  int likesCount() {
    return _isLiked ? 1 : 0;
  }

  @override
  void switchSelection() {
    _isLiked = !_isLiked;
  }
}
