import 'package:flutter/cupertino.dart';
import 'package:ruzz/update_widgets/technology_preview/decorations/elevated_decoration.dart';

class RoundedDecoration extends BoxDecoration {
  const RoundedDecoration(this.context, this.decorationColor);
  final BuildContext context;
  final Color decorationColor;

  @override
  BorderRadiusGeometry? get borderRadius => const BorderRadius.only(
        topLeft:     Radius.circular(0),
        topRight:    Radius.circular(0),
        bottomLeft:  Radius.circular(ElevatedDecoration.bottomRadius),
        bottomRight: Radius.circular(ElevatedDecoration.bottomRadius),
      );

  @override
  Color? get color => decorationColor;
}