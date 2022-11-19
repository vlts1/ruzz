import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ruzz/local_db/supported_technologies.dart';
import 'package:ruzz/update_widgets/in_list_update/technology_update_info/technology_logo.dart';

class TechnologyLogotypes {
  Widget logoOf(String technology) {
    if (SupportedTechnologies.technologiesToLogos.containsKey(technology)) {
      return TechnologyLogo(
        logoImage: SvgPicture.asset(
          SupportedTechnologies.technologiesToLogos[technology]!,
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
