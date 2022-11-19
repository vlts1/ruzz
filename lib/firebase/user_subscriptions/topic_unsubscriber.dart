import 'package:firebase_messaging/firebase_messaging.dart';

class TopicUnsubscriber {
  Future<void> unsubscribeFromTechnologyNotifications(String technology) async {
    if (technology == 'C#') {
      await FirebaseMessaging.instance.unsubscribeFromTopic('CHashtag');
    }
    else if (technology == 'VS Code') {
      await FirebaseMessaging.instance.unsubscribeFromTopic('VSCode');
    }
    else {
      await FirebaseMessaging.instance.unsubscribeFromTopic(technology);
    }
  }
}