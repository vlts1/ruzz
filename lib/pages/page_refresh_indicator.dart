import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageRefreshIndicator extends RefreshIndicator {
  PageRefreshIndicator({required super.child, required super.onRefresh});

  @override
  double get strokeWidth => 2.1;
  
  @override
  Color  get color => CupertinoColors.systemOrange;
  
  @override
  Color  get backgroundColor => Colors.white;
  
  @override
  double get edgeOffset => 65;
}