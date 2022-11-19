import 'package:cloud_firestore/cloud_firestore.dart';

class NewestVersions {
  Future<String> newestVersionOf(String technology) async {
    final techDoc = await FirebaseFirestore.instance
        .collection('releases')
        .where('technology', isEqualTo: technology)
        .orderBy('date', descending: true)
        .limit(1)
        .get(const GetOptions(source: Source.server));
    if (techDoc.docs.isNotEmpty) {
      return techDoc.docs.single.data()['version'];
    }
    return "";
  }
}
