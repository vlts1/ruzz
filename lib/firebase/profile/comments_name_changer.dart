import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ruzz/providers/current_user_info.dart';
import 'package:ruzz/providers/replies/loaded_replies.dart';
import '../../comments/comments_page/reply/reply_data.dart';

class CommentsNameChanger {
  CommentsNameChanger(this.currentUserInfo, this.loadedReplies);
  final CurrentUserInfo currentUserInfo;
  final LoadedReplies loadedReplies;

  void changeNameInComments(String newName) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc(currentUserInfo.docId)
        .update({'full_name': newName});

    for (final conversationRef in currentUserInfo.myConversations) {
      final conversationId = conversationRef.split('/').last;
      final topComment = await FirebaseFirestore.instance
          .collection('comments')
          .doc(conversationId)
          .get();

      if (topComment.data()?['user_id'] == currentUserInfo.docId) {
        FirebaseFirestore.instance
            .collection('comments')
            .doc(conversationId)
            .update({'user_name': newName});
      }

      final List<ReplyData> myReplies = loadedReplies.replies
          .where((replyData) => replyData.parentCommentId == conversationId)
          .where((replyData) => replyData.writerId == currentUserInfo.docId)
          .toList();

      for (final conversationReply in myReplies) {
        FirebaseFirestore.instance
            .collection('comments')
            .doc(conversationId)
            .collection('replies')
            .doc(conversationReply.replyId)
            .update({'user_name': newName});
      }

      final thisUserRef = FirebaseFirestore.instance.collection('users').doc(currentUserInfo.docId);

      FirebaseFirestore.instance
          .collection('comments')
          .doc(conversationId)
          .collection('replies')
          .where('receiver_id', isEqualTo: thisUserRef)
          .get()
          .then((commentsWhereImReceiver) {
            commentsWhereImReceiver.docs.forEach((comment) {
              comment.reference.update({'receiver': newName});
            });
      });
    }
  }
}