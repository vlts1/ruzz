import 'package:ruzz/providers/current_user_info.dart';

class FollowingStatusSwitcher {
  FollowingStatusSwitcher(this.technology);
  final String technology;

  void switchStatus(bool isTracked, CurrentUserInfo currentUserInfo) {
    if (isTracked) {
      currentUserInfo.unsubscribeFromTechnology(technology.trim());
    } else if (isTracked == false) {
      currentUserInfo.subscribeToTechnology(technology.trim());
    }
  }
}