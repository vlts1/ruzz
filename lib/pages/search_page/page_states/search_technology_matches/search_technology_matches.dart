import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/comments/comments_page/comment/update_info.dart';
import 'package:ruzz/local_db/technology_logotypes.dart';
import 'package:ruzz/providers/latest_technology_versions.dart';
import 'package:ruzz/update_widgets/followable_technology/followable_technology.dart';

import '../../../../providers/search_provider.dart';

class SearchTechnologyMatches extends StatefulWidget {
  const SearchTechnologyMatches({Key? key}) : super(key: key);

  @override
  State<SearchTechnologyMatches> createState() => _SearchTechnologyMatchesState();
}

class _SearchTechnologyMatchesState extends State<SearchTechnologyMatches> {
  late SearchProvider           searchProvider;
  late LatestTechnologyVersions latestTechnologyVersions;
  final technologyLogotypes = TechnologyLogotypes();

  @override
  void didChangeDependencies() {
    searchProvider           = Provider.of<SearchProvider>(context);
    latestTechnologyVersions = Provider.of<LatestTechnologyVersions>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final children = <Widget>[];
    for (String searchResult in searchProvider.searchResults) {
      children.add(
        FollowableTechnology(
          technologyInfo: UpdateInfo(
            searchResult,
            latestTechnologyVersions.lastVersionOf(searchResult),
          ),
          logo: technologyLogotypes.logoOf(searchResult),
        ),
      );
    }

    return GestureDetector(
      onTap: searchProvider.closeSearchResults,
      child: ListView(
        padding: EdgeInsets.only(
          top: 10,
          bottom: MediaQuery.of(context).padding.bottom + 200,
        ),
        children: children,
      ),
    );
  }
}
