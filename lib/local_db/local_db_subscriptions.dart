import 'package:provider/provider.dart';
import 'ruzz_db.dart';
import '../providers/current_user_info.dart';

class LocalDBSubscriptions {
  static const _timeBeforeFirstVersion = '1980-1-1';

  /// Guarantees that each technology is going to have a date
  Future<Map<String, String>> subscriptionToLastSavedVersionDate(context) async {
    final Map<String, String> technologyToLastSavedVersionDate =
          await RuzzDb.instance.latestReleaseDatesOfSubscriptions();

    final currentUserInfo = Provider.of<CurrentUserInfo>(context, listen: false);
    final myTechnologies = currentUserInfo.myTechnologies;

    for (final technology in myTechnologies) {
      if (technologyToLastSavedVersionDate.containsKey(technology) == false) {
        technologyToLastSavedVersionDate[technology] = _timeBeforeFirstVersion;
      }
    }

    return technologyToLastSavedVersionDate;
  }
}
