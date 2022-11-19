import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:ruzz/pages/page_refresh_indicator.dart';
import 'package:ruzz/pages/technology_releases_page/releases_builder.dart';
import 'package:ruzz/pages/technology_releases_page/scaffold/releases_page_cupertino_scaffold.dart';
import 'package:ruzz/pages/technology_releases_page/scaffold/releases_page_material_scaffold.dart';
import '../../firebase/releases/technology_releases.dart';
import '../../local_db/release.dart';

class TechnologyReleasesPage extends StatefulWidget {
  const TechnologyReleasesPage({Key? key}) : super(key: key);
  static const route = '/technology-releases-page';
  @override
  State<TechnologyReleasesPage> createState() => _TechnologyReleasesPageState();
}

class _TechnologyReleasesPageState extends State<TechnologyReleasesPage> {
  final releasesGetter  = TechnologyReleases();
  final releasesBuilder = ReleasesBuilder();
  Future<List<Release>>? releases;
  String? technology;

  @override
  void didChangeDependencies() {
    if (releases == null && technology == null) {
      technology = ModalRoute.of(context)!.settings.arguments as String;
      releases = releasesGetter.fetchAllReleases(technology!);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final body = PageRefreshIndicator(
        onRefresh: () async {
          releases = releasesGetter.fetchAllReleases(technology!);
          await releases;
          setState(() {});
        },
        child: releasesBuilder.displayReleases(releases)
      );
      
    return Platform.isIOS
        ? ReleasesPageCupertinoScaffold(technology: technology!, body: body)
        : ReleasesPageMaterialScaffold (technology: technology!, body: body);
  }
}