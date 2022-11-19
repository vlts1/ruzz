import 'package:flutter/cupertino.dart';
import 'package:ruzz/comments/comments_page/loading_indicator.dart';
import 'package:ruzz/pages/technology_releases_page/error_loading_screen.dart';
import '../../local_db/release.dart';
import '../../update_widgets/releases_page_update/technology_page_update.dart';

class ReleasesBuilder {
  Widget displayReleases(Future<List<Release>>? releases) {
    return FutureBuilder(
      future: releases,
      builder: (context, AsyncSnapshot<List<Release>> snapshot) {
        if (snapshot.connectionState == ConnectionState.none) return ErrorLoadingScreen();
        if (snapshot.hasError) return ErrorLoadingScreen(); 

        if (snapshot.hasData == false) {
          return Center(child: const LoadingIndicator());
        } 
        else {
          final List<TechnologyPageUpdate> updates = [];
          for (final release in snapshot.data!) {
            updates.add(TechnologyPageUpdate(release: release));
          }
          return ListView(children: updates, padding: EdgeInsets.only(top: 15));
        }
      },
    );
  }
}