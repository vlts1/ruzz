import 'package:flutter/material.dart';
import '../../../../update_widgets/followable_technology/track_technology_button.dart';

class ReleasesPageMaterialAppBar extends AppBar {
  ReleasesPageMaterialAppBar(this.technologyName);
  final String technologyName;

  @override
  List<Widget> get actions =>
      [TrackTechnologyButton(technologyName, padding: EdgeInsets.only(right: 8))];

  @override
  Widget get title => Text("$technologyName Releases", textAlign: TextAlign.center);

  @override
  bool get centerTitle => true;
}
