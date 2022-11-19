import 'package:flutter/cupertino.dart';
import 'i_platform_color.dart';

class TechnologyPreviewLogoBackground extends CupertinoDynamicColor implements IPlatformColor{
  const TechnologyPreviewLogoBackground()
      : super.withBrightness(
          color: CupertinoColors.white,
          darkColor: CupertinoColors.darkBackgroundGray,
        );

  
  @override
  Color fromTheme(BuildContext context) {
    return CupertinoDynamicColor.resolve(this, context);
  }
}
