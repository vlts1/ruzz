import 'package:flutter/material.dart';

class CircularImageDecoration extends BoxDecoration {
  const CircularImageDecoration(this.insideImage);
  final Image insideImage;

  @override
  BoxShape get shape => BoxShape.circle;

  @override
  DecorationImage? get image => DecorationImage(
        image: insideImage.image,
        fit: BoxFit.cover,
      );
}
