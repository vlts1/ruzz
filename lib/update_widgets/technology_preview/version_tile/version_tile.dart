import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/system_text_color.dart';
import 'package:ruzz/themes/system_text_size.dart';
import 'package:ruzz/update_widgets/technology_preview/version_tile/rounded_decoration.dart';
import '../../../themes/colors/text_indicator_color.dart';
import '../../../themes/colors/version_tile_background_color.dart';

class VersionTile extends StatelessWidget {
  VersionTile(this.version, {Key? key}) : super(key: key);
  final String version;
  final _textIndicatorColor = TextIndicatorColor();
  final _backgroundColor    = VersionTileBackgroundColor();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: RoundedDecoration(
        context,
        _backgroundColor.fromTheme(context),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Latest:",
              style: TextStyle(
                color:   _textIndicatorColor.fromTheme(context),
                fontSize: SystemTextSize.fromPlatform(context) * 0.71,
              ),
            ),
            FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                version,
                style: TextStyle(
                  color:      SystemTextColor.getColor(context),
                  fontWeight: FontWeight.w500,
                  fontSize:   SystemTextSize.fromPlatform(context) * 1.05,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
