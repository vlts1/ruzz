import 'package:flutter/material.dart';

class KeyAdder {
  Container wrapWithKey(Widget widget, GlobalKey key) {
    return Container(child: widget, key: key);
  }
}
