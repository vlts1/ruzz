import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShadowElevation extends BoxShadow {
  ShadowElevation(this.context);
  final BuildContext context;
  final _shadowColor = CupertinoDynamicColor.withBrightness(
    color: Colors.grey.shade500.withOpacity(.4),
    darkColor: const Color.fromARGB(0, 0, 0, 0),
  );

  @override
  Color get color => CupertinoDynamicColor.resolve(_shadowColor, context);

  @override
  double get blurRadius => 1.6;

  @override
  Offset get offset => const Offset(0, 2);
}
