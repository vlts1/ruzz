import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../firebase/user_subscriptions/topic_unsubscriber.dart';
import '../../local_db/ruzz_db.dart';
import '../../providers/current_user_info.dart';

class AccountDeleter {
  final _topicUnsubscriber = TopicUnsubscriber();

  Future<void> deleteAccount(BuildContext context) async {
    debugPrint('deleting ' + FirebaseAuth.instance.currentUser!.uid);
    FirebaseAuth.instance.currentUser!.delete();

    final currentUserInfo = Provider.of<CurrentUserInfo>(context, listen: false);
    for (final subscription in currentUserInfo.myTechnologies) {
      _topicUnsubscriber.unsubscribeFromTechnologyNotifications(subscription);
    }     
    await RuzzDb.instance.removeAllReleases(currentUserInfo.myTechnologies);
    currentUserInfo.setNotInitiated();
  }
}