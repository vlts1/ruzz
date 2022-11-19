import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/search_page/page_states/search_technology_matches/search_technology_matches.dart';
import 'package:ruzz/pages/search_page/search_nav_bar.dart';
import 'package:ruzz/pages/search_page/page_states/technology_previews/technology_previews.dart';
import 'package:ruzz/providers/latest_technology_versions.dart';
import '../../local_db/technology_logotypes.dart';
import '../../providers/search_provider.dart';

class UpdatesSearch extends StatefulWidget {
  const UpdatesSearch({required this.scrollController, super.key});

  final ScrollController scrollController;
  @override
  State<UpdatesSearch> createState() => UpdatesSearchState();
}

class UpdatesSearchState extends State<UpdatesSearch> {
  final logos = TechnologyLogotypes();
  late SearchProvider searchProvider;
  late LatestTechnologyVersions latestTechnologyVersions;
  late Widget child;

  @override
  void didChangeDependencies() {
    searchProvider = Provider.of<SearchProvider>(context);
    latestTechnologyVersions = Provider.of<LatestTechnologyVersions>(context);

    child = AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: SafeArea(
        child: searchProvider.areSearchResultsVisible
            ? const SearchTechnologyMatches()
            : TechnologyPreviews(scrollController: widget.scrollController),
      ),
    );
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanDown: (details) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Platform.isIOS
          ? CupertinoPageScaffold(
              navigationBar: const SearchNavBar(),
              child: child,
            )
          : Scaffold(
              appBar: SearchNavBar(),
              body: child,
            ),
    );
  }
}