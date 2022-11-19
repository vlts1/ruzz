import 'package:flutter/cupertino.dart';

import '../../../../themes/colors/accent_button_color.dart';

class DoneButtonBackground extends StatelessWidget {
  DoneButtonBackground({super.key});
  final accentButtonColor = AccentButtonColor();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: accentButtonColor.fromTheme(context),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [ Text("Done") ],
      ),
    );
  }
}
