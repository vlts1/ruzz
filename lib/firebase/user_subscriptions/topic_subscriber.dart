import 'package:firebase_messaging/firebase_messaging.dart';

class TopicSubscriber {
  Future<void> subscribeToTechnologyNotifications(String technology) async {
    if (technology == 'C#') {
      await FirebaseMessaging.instance.subscribeToTopic('CHashtag');
    }
    else if (technology == 'VS Code') {
      await FirebaseMessaging.instance.subscribeToTopic('VSCode');
    }
    else {
      await FirebaseMessaging.instance.subscribeToTopic(technology);
    }
  }
}