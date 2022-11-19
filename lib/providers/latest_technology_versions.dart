import 'package:flutter/material.dart';
import 'package:ruzz/local_db/supported_technologies.dart';
import '../firebase/user_subscriptions/newest_versions.dart';

class LatestTechnologyVersions extends ChangeNotifier {
  final _technologies = SupportedTechnologies.technologiesToLogos.keys.toList();
  List<String> _lastVersions = [];

  final _newestVersions = NewestVersions();

  Future<void> fetchLatestVersions() async {
    final fetchedLastVersions = <Future<String>>[];
    for (final technology in _technologies) {
      fetchedLastVersions.add(_newestVersions.newestVersionOf(technology));
    }

    final loadedLastVersions = <String> [];
    for (final lastVersion in fetchedLastVersions) {
      loadedLastVersions.add(await lastVersion);
    }

    _lastVersions = loadedLastVersions;

    assert(_technologies.length == _lastVersions.length);
    notifyListeners();
  }

  String lastVersionOf(String technology) {
    final int versionIndex = _technologies.indexOf(technology);
    return _lastVersions[versionIndex];
  }
}
