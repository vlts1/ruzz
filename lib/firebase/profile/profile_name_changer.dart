import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileNameChanger {
  Future<void> changeUserName(String newName, String userDocId) async {
    final users = FirebaseFirestore.instance.collection('users');
    await users.doc(userDocId).update({'full_name': newName});
  }
}
