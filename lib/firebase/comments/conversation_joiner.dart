import 'package:cloud_firestore/cloud_firestore.dart';

class ConversationJoiner {
  Future<void> joinConversation(String userId, String commentReference) async {
    await FirebaseFirestore.instance.collection("users").doc(userId).update({
      'my_conversations': FieldValue.arrayUnion([commentReference])
    });
  }
}
