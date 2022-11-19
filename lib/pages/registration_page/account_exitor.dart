import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/firebase/user_subscriptions/topic_unsubscriber.dart';
import 'package:ruzz/local_db/ruzz_db.dart';
import 'package:ruzz/providers/current_user_info.dart';

class AccountExitor {
  final _topicUnsubscriber = TopicUnsubscriber();

  Future<void> logOut(BuildContext context) async {
    debugPrint('signing out from ' + FirebaseAuth.instance.currentUser!.uid);
    if (FirebaseAuth.instance.currentUser!.isAnonymous) {
      FirebaseAuth.instance.currentUser!.delete();
    }
    await FirebaseAuth.instance.signOut();

    final currentUserInfo = Provider.of<CurrentUserInfo>(context, listen: false);
    for (final subscription in currentUserInfo.myTechnologies) {
      _topicUnsubscriber.unsubscribeFromTechnologyNotifications(subscription);
    }     
    await RuzzDb.instance.removeAllReleases(currentUserInfo.myTechnologies);
    currentUserInfo.setNotInitiated();
  }
}