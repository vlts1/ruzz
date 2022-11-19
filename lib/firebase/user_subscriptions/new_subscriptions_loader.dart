import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/firebase/user_subscriptions/removed_subscriptions_local_synchronizer.dart';
import 'package:ruzz/local_db/local_db_subscriptions.dart';
import 'package:ruzz/local_db/release.dart';
import 'package:ruzz/local_db/ruzz_db.dart';
import 'package:ruzz/local_db/ruzz_db_date_to_date_time_adapter.dart';
import 'package:ruzz/providers/current_user_info.dart';

class NewSubscriptionsLoader {
  NewSubscriptionsLoader(this.context);
  final BuildContext context;
  final _localDbSubscriptions = LocalDBSubscriptions();
  final _removedSubscriptionsLocalSync = RemovedSubscriptionsLocalSynchronizer();
  late final _currentUserInfo = Provider.of<CurrentUserInfo>(context, listen: false);

  Future<List<Release>> saveUnsavedSubscriptions() async {
    Map<String, String> technologyToLastSavedVersionDate = 
      await _localDbSubscriptions.subscriptionToLastSavedVersionDate(context);

    _removedSubscriptionsLocalSync.syncRemovedSubscriptions(
      technologyToLastSavedVersionDate,
      _currentUserInfo.myTechnologies,
    );

    final List<Release> unsavedReleases = [];
    for (final technology in technologyToLastSavedVersionDate.keys) {
      final DateTime date = RuzzDbDateToDateTimeAdapter(
        technologyToLastSavedVersionDate[technology],
      );

      final unsavedVersions = await FirebaseFirestore.instance
          .collection('releases')
          .where('technology', isEqualTo: technology)
          .where('date', isGreaterThan: Timestamp.fromDate(date))
          .get();

      if (unsavedVersions.docs.isNotEmpty) {
        for (final releaseDoc in unsavedVersions.docs) {
          final firestoreRelease = Release.fromFirestore(releaseDoc.data());

          unsavedReleases.add(firestoreRelease);
          ///? Temporary slower solution
          await RuzzDb.instance.addNewRelease(firestoreRelease);
        }
      }
    }
    
    //! FIXME
    /// In case with meteor 2.8, was adding the update even if it already existed.
    /// Tested on october 20, meteor 2.8 was released on oct 19. 
    /// await RuzzDb.instance.addAllReleases(unsavedReleases);

    return unsavedReleases;
  }
}