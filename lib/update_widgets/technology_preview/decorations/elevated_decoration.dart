import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ruzz/update_widgets/technology_preview/decorations/shadow_elevation.dart';

class ElevatedDecoration extends BoxDecoration {
  ElevatedDecoration(this.context, this.backgroundColor);
  final BuildContext context;
  final Color backgroundColor;
  static const bottomRadius = 12.0;
  
  final _borderColor = CupertinoDynamicColor.withBrightness(
    color: Colors.grey.shade300,
    darkColor: Colors.grey.shade500,
  );

  @override
  Color? get color => backgroundColor;

  @override
  BorderRadiusGeometry? get borderRadius => BorderRadius.circular(bottomRadius);

  @override
  List<BoxShadow>? get boxShadow => [ShadowElevation(context)];

  @override
  BoxBorder? get border => Border.all(
        color: CupertinoDynamicColor.resolve(_borderColor, context),
        width: 0.2,
      );
}
