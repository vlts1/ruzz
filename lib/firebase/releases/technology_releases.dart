import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ruzz/local_db/release.dart';

class TechnologyReleases {
  Future<List<Release>> fetchAllReleases(String technology) async {
    final releases = await FirebaseFirestore.instance
        .collection('releases')
        .where('technology', isEqualTo: technology)
        .orderBy('date', descending: true)
        .get();

    final List<Release> castedReleases = [];
    for (var doc in releases.docs) {
      castedReleases.add(Release.fromFirestore(doc.data()));
    }
    return castedReleases;
  }
}
