import 'dart:math';
import 'package:flutter/services.dart';

class RandomStartingLogoPicker {
  final logoColors = ['blue', 'green', 'orange', 'pink', 'purple'];
  final _random = Random();

  Future<Uint8List> pickLogo() async {
    final randomColor = logoColors[_random.nextInt(logoColors.length)];
    final logoPath = 'images/def-icon-' + randomColor + '.png';
    print('RandomStartingLogoPicker' + logoPath);
    return (await rootBundle.load(logoPath)).buffer.asUint8List();
  }
}
