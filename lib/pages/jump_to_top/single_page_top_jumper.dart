import 'package:flutter/material.dart';

class SinglePageTopJumper {
  final _controller = ScrollController();

  void goToTop() {
    _controller.animateTo(
      0,
      duration: const Duration(milliseconds: 950),
      curve: Curves.linearToEaseOut,
    );
  }

  ScrollController get listController => _controller;
}