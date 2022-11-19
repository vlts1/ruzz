import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/system_text_color.dart';
import 'package:ruzz/themes/system_text_size.dart';
import 'package:ruzz/update_widgets/in_list_update/technology_update_info/technology_logo.dart';

class LogoTile extends StatelessWidget {
  const LogoTile({
    required this.logo,
    required this.technologyName,
    Key? key,
  }) : super(key: key);

  final TechnologyLogo logo;
  final String technologyName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 3),
        logo,
        const SizedBox(height: 5),
        Text(
          technologyName,
          style: TextStyle(
            color: SystemTextColor.getColor(context),
            fontWeight: FontWeight.w500,
            fontSize: 
              SystemTextSize.fromPlatform(context) * 1.1,
          ),
        ),
      ],
    );
  }
}