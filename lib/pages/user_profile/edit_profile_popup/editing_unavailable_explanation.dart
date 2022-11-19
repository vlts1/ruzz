import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/colors/secondary_text_color.dart';
import 'package:ruzz/themes/system_text_size.dart';

class EditingUnavailableExplanation extends StatelessWidget {
  EditingUnavailableExplanation({super.key});
  final _secondaryTextColor = SecondaryTextColor();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Text(
        'Anonymous accounts cannot modify their profile',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: _secondaryTextColor.fromTheme(context),
          fontSize: SystemTextSize.fromPlatform(context) - 3,
        ),
      ),
    );
  }
}
