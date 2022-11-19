import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/icons/arrow/chevron_arrow_icon.dart';
import '../../../themes/colors/accent_button_color.dart';

class EditProfileButtonBackground extends StatelessWidget {
  EditProfileButtonBackground({super.key});
  final _accentButtonColor = AccentButtonColor();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      width: MediaQuery.of(context).size.width - 100,
      decoration: BoxDecoration(
        color: _accentButtonColor.fromTheme(context),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ Text("Edit Profile"), ChevronArrowIcon() ],
      ),
    );
  }
}
