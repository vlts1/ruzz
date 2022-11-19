import 'package:cloud_firestore/cloud_firestore.dart';

class UpdatesLastLoadedComment {
  final Map<String, DocumentSnapshot> _updateToLastLoadedDoc = {};

  void setLastLoaded(String technology, String version, DocumentSnapshot doc) {
    _updateToLastLoadedDoc[technology + version] = doc;
  }

  DocumentSnapshot? getLastLoaded(String technology, String version) {
    return _updateToLastLoadedDoc[technology + version];
  }
}