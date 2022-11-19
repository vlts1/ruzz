import 'package:cloud_firestore/cloud_firestore.dart';

class ConversationForgetter {
  Future<void> forgetConversation(String userId, String commentRef) async {
    await FirebaseFirestore.instance.collection("users").doc(userId).update({
      'my_conversations': FieldValue.arrayRemove([commentRef])
    });
  }
}