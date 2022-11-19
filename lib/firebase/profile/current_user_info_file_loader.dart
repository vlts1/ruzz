import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/firebase/images/profile_pic_firebase_storage_loader.dart';
import 'package:ruzz/firebase/images/profile_pic_firebase_storage_modifier.dart';
import 'package:ruzz/pages/user_profile/edit_profile_popup/profile_image/random_starting_logo_picker.dart';
import 'package:ruzz/providers/current_user_info.dart';

class CurrentUserInfoFileLoader {
  //TODO refactor
  Future<void> addUserToDb(BuildContext context) async {
    final picModifier = ProfilePicFirebaseStorageModifier(context);
    final logoPicker = RandomStartingLogoPicker();

    final userId = FirebaseAuth.instance.currentUser!.uid;
    final isAnonymous = FirebaseAuth.instance.currentUser!.isAnonymous;
    late final String userName;

    if (FirebaseAuth.instance.currentUser?.displayName != null) {
      userName = FirebaseAuth.instance.currentUser!.displayName!;
    } else {
      if (isAnonymous) userName = 'Anonymous User';
      else userName = "New User";
    }

    final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get(GetOptions(source: Source.server));

    debugPrint('add user to db: ' + userId);
    if (userDoc.exists == false) {
      debugPrint("user doc doesn't exist yet");
      await FirebaseFirestore.instance.collection('users').doc(userId).set(
        {
          'checked_conversations_on': Timestamp.now(),
          'full_name': userName,
          'join_date': Timestamp.now(),
          'my_conversations': [],
          'my_technologies':  [],
        },
      );
      debugPrint("added a new user doc");
      if (isAnonymous == false) {
        await picModifier.setProfilePic(await logoPicker.pickLogo());
      }
    }
  }

  

  Future<void> initCurrentUserInfo(BuildContext context) async {
    final picLoader = ProfilePicFirebaseStorageLoader(context);

    final userId = FirebaseAuth.instance.currentUser!.uid;
    late DocumentSnapshot<Map<String, dynamic>> docLoaded;
    late Future<Image> profilePic;

    try {
      profilePic = picLoader.profilePic;
      docLoaded = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get(GetOptions(source: Source.server));
      if (docLoaded.exists == false) throw Exception();
    }
    catch (e) {
      await addUserToDb(context);
      docLoaded = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get(GetOptions(source: Source.server));
      profilePic = picLoader.profilePic;
    }
    Image picLoaded = await profilePic;

    print(FirebaseAuth.instance.currentUser!.uid);
    Provider.of<CurrentUserInfo>(context, listen: false).initiateFields(
      picLoaded,
      docLoaded.get('full_name'),
      docLoaded.id,
      (docLoaded.get('join_date') as Timestamp).toDate(),
      (docLoaded.get('checked_conversations_on') as Timestamp).toDate(),
      (docLoaded.get('my_technologies') as List<dynamic>).isEmpty
          ? []
          : List<String>.from(docLoaded.get('my_technologies'), growable: true),

      (docLoaded.get('my_conversations') as List<dynamic>).isEmpty
          ? []
          : List<String>.from(docLoaded.get('my_conversations'), growable: true),
    );
  }
}
