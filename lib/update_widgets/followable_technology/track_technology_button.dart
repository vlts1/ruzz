import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/providers/current_user_info.dart';
import 'package:ruzz/themes/icons/subscribe/subscribe_to_technology/subscribe_icon.dart';
import 'package:ruzz/themes/icons/subscribe/unsubscribe_from_technology/unsubscrube_icon.dart';

import 'following_status_switcher.dart';

class TrackTechnologyButton extends StatefulWidget {
  const TrackTechnologyButton(this.technology, {this.padding, Key? key}): super(key: key);
  final String technology;
  final EdgeInsets? padding;
  @override
  State<TrackTechnologyButton> createState() => _TrackTechnologyButtonState();
}

class _TrackTechnologyButtonState extends State<TrackTechnologyButton> {
  late CurrentUserInfo currentUserInfo;
  late final followingStatusSwitcher = FollowingStatusSwitcher(widget.technology);

  @override
  void didChangeDependencies() {
    currentUserInfo = Provider.of<CurrentUserInfo>(context);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    bool isTracked = currentUserInfo.myTechnologies.contains(widget.technology);
    final child = isTracked ? const UnsubscribeIcon() : const SubscribeIcon();
    return Platform.isIOS
        ? CupertinoButton(
            padding: widget.padding,
            child: child,
            onPressed: () { followingStatusSwitcher.switchStatus(isTracked, currentUserInfo); },
          )
        : TextButton(
            onPressed: () { followingStatusSwitcher.switchStatus(isTracked, currentUserInfo); },
            child: child,
          );
  }
}