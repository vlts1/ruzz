import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/providers/current_user_info.dart';
import 'package:ruzz/themes/icons/subscribe/subscribe_to_technology/subscribe_icon.dart';
import 'package:ruzz/themes/icons/subscribe/subscribe_to_technology/subscribe_icon_alternative.dart';
import 'package:ruzz/themes/icons/subscribe/unsubscribe_from_technology/unsubscribe_icon_alternative.dart';
import 'package:ruzz/update_widgets/followable_technology/following_status_switcher.dart';

class TrackTechnologyAlternativeButton extends StatefulWidget {
  const TrackTechnologyAlternativeButton(this.technology, {this.padding, Key? key});
  final String technology;
  final EdgeInsets? padding;

  @override
  State<TrackTechnologyAlternativeButton> createState() => _TrackTechnologyAlternativeButtonState();
}

class _TrackTechnologyAlternativeButtonState extends State<TrackTechnologyAlternativeButton> {
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
    final child = isTracked ? const UnsubscribeIconAlternative() : const SubscribeIconAlternative();

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