import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/providers/current_user_info.dart';

import '../../themes/colors/toast_color.dart';
import '../../themes/system_text_color.dart';

class FollowingStatusPopup {
  FollowingStatusPopup(this.context);
  final BuildContext context;
  final toastColor = ToastColor();

  void displayStatus(String technology) {
    final String addedMessage   = "Subscribed to $technology";
    final String removedMessage = "Unsubscribed from $technology";

    final trackedProvider = Provider.of<CurrentUserInfo>(context, listen: false);
    final bool isTracked  = trackedProvider.myTechnologies.contains(technology);

    Fluttertoast.showToast(
      msg: isTracked ? addedMessage : removedMessage,
      toastLength: Toast.LENGTH_LONG,
      textColor: SystemTextColor.getColor(context),
      backgroundColor: toastColor.fromTheme(context),
    );
  }
}
