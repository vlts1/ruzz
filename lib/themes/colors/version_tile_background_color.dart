import 'package:flutter/cupertino.dart';
import 'i_platform_color.dart';

class VersionTileBackgroundColor extends CupertinoDynamicColor implements IPlatformColor {
  const VersionTileBackgroundColor()
      : super.withBrightness(
          color: CupertinoColors.systemGrey6,
          darkColor: const Color.fromARGB(255, 47, 47, 47),
        );

  @override
  Color fromTheme(BuildContext context) {
    return CupertinoDynamicColor.resolve(this, context);
  }
}
