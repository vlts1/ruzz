import 'package:cloud_firestore/cloud_firestore.dart';

class RepliesCheckedDateUpdater {
  Future<void> updateDate(DateTime checkedOn, String userId) async {
    await FirebaseFirestore.instance.collection('users').doc(userId).update(
      {
        'checked_conversations_on': Timestamp.fromDate(checkedOn),
      },
    );
  }
}
