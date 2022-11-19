import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/search_page/android_search.dart';
import 'package:ruzz/pages/search_page/ios_search.dart';
import 'package:ruzz/pages/search_page/search_results_displayer.dart';
import 'package:ruzz/providers/search_provider.dart';

class SearchNavBar extends StatefulWidget
    implements ObstructingPreferredSizeWidget {
  const SearchNavBar({Key? key}) : super(key: key);

  @override
  State<SearchNavBar> createState() => _SearchNavBarState();

  final _searchFieldHeight = 20;
  get _navBarHeight {
    return Platform.isIOS
        ? kToolbarHeight + _searchFieldHeight + 18
        : kToolbarHeight + _searchFieldHeight + 28;
  }

  @override
  Size get preferredSize => Size.fromHeight(_navBarHeight);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}

class _SearchNavBarState extends State<SearchNavBar> {
  final searchResultsDisplayer = SearchResultsDisplayer();
  late SearchProvider searchProvider;
  @override
  void didChangeDependencies() {
    searchProvider = Provider.of<SearchProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final barBackgroundColor = CupertinoTheme.of(context).barBackgroundColor;
    final separatorColor = CupertinoDynamicColor.withBrightness(
      color:     CupertinoColors.systemGrey4,
      darkColor: Colors.grey.shade800,
    );
    return Container(
      decoration: BoxDecoration(
        color: barBackgroundColor,
        border: Border(
          bottom: BorderSide(
            width: 0.4,
            color: CupertinoDynamicColor.resolve(separatorColor, context),
          ),
        ),
      ),
      child: Platform.isIOS ? IosSearch() : AndroidSearch(),
    );
  }
}
