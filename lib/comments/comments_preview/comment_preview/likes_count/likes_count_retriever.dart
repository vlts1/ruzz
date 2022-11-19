import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ruzz/comments/comments_preview/comment_preview/likes_count/i_likes_count_retriever.dart';
import 'package:ruzz/firebase/comments/likes/comment_like_remover.dart';
import 'package:ruzz/firebase/comments/likes/comment_liked_by_user.dart';
import 'package:ruzz/firebase/comments/likes/comment_liker.dart';
import 'package:ruzz/firebase/comments/likes/comment_likes.dart';
import 'package:ruzz/firebase/comments/relative_path/relative_path_receiver.dart';

class LikesCountRetriever implements ILikesCountRetriever{
  LikesCountRetriever(String postPath, String userId, String postWriterId) {
    _commentLikeRemover = CommentLikeRemover(postPath, userId);
    _commentLiker       = CommentLiker      (postPath, userId, postWriterId);
    _commentLikedByUser = CommentLikedByUser(postPath, userId);
    _commentLikes       = CommentLikes      (postPath);
  }

  factory LikesCountRetriever.fromComment(DocumentSnapshot doc, String currentUserId) {
    final RelativePathReceiver pathReceiver = RelativePathReceiver();
    return LikesCountRetriever(    
      doc.reference.path,
      pathReceiver.toRelative(currentUserId),
      pathReceiver.toRelative(doc.get("user_id").toString()),
    );
  }

  final String _errorDidntAwaitInit = "LikesCountRetriever won't work before asynchronous init() ends its execution";
  
  bool? _isSelected;
  int?  _likesWithoutUser;
  int?  _likesWithUser;

  late final CommentLikeRemover _commentLikeRemover;
  late final CommentLiker       _commentLiker;
  late final CommentLikedByUser _commentLikedByUser;
  late final CommentLikes       _commentLikes;

  @override
  Future<void> init() async {
    _commentLikedByUser.isCommentLiked;
    _isSelected ??= await _commentLikedByUser.isCommentLiked;

    if (_likesWithUser == null || _likesWithoutUser == null) {
      final int likes = await _commentLikes.likesCount;

      _likesWithoutUser ??= _isSelected! ? likes - 1 : likes;
      _likesWithUser    ??= _isSelected! ? likes : likes + 1;
    }
  }

  @override
  int likesCount() {
    assert(_likesWithUser    != null, _errorDidntAwaitInit);
    assert(_likesWithoutUser != null, _errorDidntAwaitInit);
    
    if (_isSelected == true) {
      return _likesWithUser!;
    }
    return _likesWithoutUser!;
  }

  @override
  bool get isSelected {
    assert(_isSelected != null, _errorDidntAwaitInit);
    return _isSelected!;
  }

  @override
  void switchSelection() {
    assert(_isSelected != null, _errorDidntAwaitInit);

    if (_isSelected == true) {
      _commentLikeRemover.removeLike();
      _isSelected = false;
      return;
    }
    if (_isSelected == false) {
      _commentLiker.likeComment();
      _isSelected = true;
    }
  }
}
