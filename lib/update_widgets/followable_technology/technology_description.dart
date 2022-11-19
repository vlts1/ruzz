import 'package:flutter/cupertino.dart';
import 'package:ruzz/comments/comments_page/comment/update_info.dart';
import 'package:ruzz/themes/colors/secondary_text_color.dart';
import 'package:ruzz/themes/system_text_color.dart';
import 'package:ruzz/themes/system_text_size.dart';

class TechnologyDescription extends StatelessWidget {
  TechnologyDescription({required this.technologyInfo, Key? key}) : super(key: key);
  final UpdateInfo technologyInfo;
  final _secondaryTextColor = SecondaryTextColor();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          technologyInfo.technology,
          style: TextStyle(
            color: SystemTextColor.getColor(context),
            fontSize: SystemTextSize.fromPlatform(context),
          ),
        ),
        Text(
          "Latest: " + technologyInfo.version,
          style: TextStyle(
            color: _secondaryTextColor.fromTheme(context),
            fontWeight: FontWeight.w300,
            fontSize: SystemTextSize.fromPlatform(context) - 1,
          ),
        ),
      ],
    );
  }
}
