import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ruzz/themes/colors/followable_technology_color.dart';

class BackgroundTile extends StatelessWidget {
  BackgroundTile({required this.child, Key? key}) : super(key: key);
  final Widget child;
  final _followableTechnologyColor = FollowableTechnologyColor();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        HapticFeedback.mediumImpact();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: const EdgeInsets.only(top: 6, bottom: 6, left: 15, right: 6),
        decoration: BoxDecoration(
          color: _followableTechnologyColor.fromTheme(context), 
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }
}
