import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  const FadeAnimation({required this.child, Key? key}) : super(key: key);
  final Widget child;

  @override
  _TextFadeAnimationState createState() => _TextFadeAnimationState();
}

class _TextFadeAnimationState extends State<FadeAnimation> with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double>   _animation;
  @override
  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 80),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
