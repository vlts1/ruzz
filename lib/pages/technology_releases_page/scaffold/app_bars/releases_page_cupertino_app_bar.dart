import 'package:flutter/cupertino.dart';
import 'package:ruzz/update_widgets/followable_technology/track_technology_alternative_button.dart';

class ReleasesPageCupertinoAppBar extends CupertinoNavigationBar {
  const ReleasesPageCupertinoAppBar({required this.technologyName, Key? key})
      : super(key: key);
  final String technologyName;

  @override
  Widget get trailing => TrackTechnologyAlternativeButton(
        technologyName,
        padding: EdgeInsets.zero,
      );

  @override
  Widget get middle => Text("$technologyName Releases", textAlign: TextAlign.center);

  @override
  String get previousPageTitle => "Release";
}