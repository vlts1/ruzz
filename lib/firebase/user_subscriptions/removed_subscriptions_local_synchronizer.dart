import '../../local_db/ruzz_db.dart';

class RemovedSubscriptionsLocalSynchronizer {
  void syncRemovedSubscriptions(
      Map<String, String> technologyToLastSavedVersionDateLocal,
      List<String> firestoreTechnologies
  ) {
    final localSubsToRemove = <String> [];

    for (final technology in technologyToLastSavedVersionDateLocal.keys) {
      if (firestoreTechnologies.contains(technology) == false) {
        localSubsToRemove.add(technology);
      }
    }

    for (final technologyToRemove in localSubsToRemove) {
      technologyToLastSavedVersionDateLocal.remove(technologyToRemove);
    }

    RuzzDb.instance.removeAllReleases(localSubsToRemove);
  }
}