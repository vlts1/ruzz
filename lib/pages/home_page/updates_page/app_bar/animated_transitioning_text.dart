import 'package:flutter/material.dart';

class AnimatedTransitioningText extends StatelessWidget {
  const AnimatedTransitioningText(this.title, {Key? key}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(
          opacity: CurvedAnimation(
            parent: animation,
            curve: Curves.easeInBack,
          ),
          child: child,
        );
      },
      child: Text(
        title,
        key: ValueKey<String>(title),
      ),
    );
  }
}
