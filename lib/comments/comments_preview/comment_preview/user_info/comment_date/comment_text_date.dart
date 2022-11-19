import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/system_text_size.dart';

class CommmentTextDate extends StatelessWidget {
  const CommmentTextDate(this.textDate, {Key? key}) : super(key: key);
  final String textDate;
  final _textColor = const CupertinoDynamicColor.withBrightness(
    color: Color.fromARGB(255, 78, 78, 78),
    darkColor: Color.fromARGB(255, 150, 150, 150),
  );
  @override
  Widget build(BuildContext context) {
    return Text(
      textDate,
      style: TextStyle(
        fontSize: SystemTextSize.fromPlatform(context) - 4,
        color: CupertinoDynamicColor.resolve(_textColor, context),
      ),
    );
  }
}
