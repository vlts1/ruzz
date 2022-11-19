import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/providers/current_user_info.dart';
import 'package:ruzz/providers/latest_technology_versions.dart';
import '../../../comments/comments_page/comment/update_info.dart';
import '../../../local_db/technology_logotypes.dart';
import '../../../update_widgets/followable_technology/followable_technology.dart';

class TrackedPage extends StatefulWidget {
  const TrackedPage({Key? key}) : super(key: key);
  static const route = "/tracked";
  @override
  State<TrackedPage> createState() => _TrackedPageState();
}

class _TrackedPageState extends State<TrackedPage> {
  late CurrentUserInfo currentUserInfo;
  late LatestTechnologyVersions latestTechnologyVersions;

  final logos = TechnologyLogotypes();
  late Widget userTechnologies;
  @override
  void didChangeDependencies() {
    currentUserInfo = Provider.of<CurrentUserInfo>(context);
    latestTechnologyVersions = Provider.of<LatestTechnologyVersions>(context);

    userTechnologies = SafeArea(
      bottom: false,
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 15, bottom: 25),
        itemCount: currentUserInfo.myTechnologies.length,
        itemBuilder: ((context, index) {
          final String technology = currentUserInfo.myTechnologies[index];
          return FollowableTechnology(
            logo: logos.logoOf(technology),
            technologyInfo: UpdateInfo(
              technology,
              latestTechnologyVersions.lastVersionOf(technology),
            ),
          );
        }),
      ),
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text("Subscriptions"),
              previousPageTitle: "Updates",
            ),
            child: userTechnologies,
          )
        : Scaffold(
            body: userTechnologies,
            appBar: AppBar(title: Text('Subscriptions'), centerTitle: true),
          );
  }
}