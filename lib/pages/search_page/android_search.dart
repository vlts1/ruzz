import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/search_page/search_results_displayer.dart';

import '../../providers/search_provider.dart';

class AndroidSearch extends StatefulWidget {
  AndroidSearch({super.key});

  @override
  State<AndroidSearch> createState() => _AndroidSearchState();
}

class _AndroidSearchState extends State<AndroidSearch> {
  final _searchResultsDisplayer = SearchResultsDisplayer();
  late SearchProvider searchProvider;
  @override
  void didChangeDependencies() {
    searchProvider = Provider.of<SearchProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final searchColor = MediaQuery.of(context).platformBrightness == Brightness.light
      ? Colors.white
      : Colors.black;
    return Column(
      children: [
        AppBar(title: Text('Search'), centerTitle: true),
        TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 15),
            filled: true,
            prefixIcon: Container(
              color: searchColor,
              padding: const EdgeInsets.only(left: 17, right: 15, top: 3),
              child: Icon(Icons.search),
            ),
            fillColor: searchColor,
            iconColor: searchColor,
            border: InputBorder.none,
            hintText: "Languages, Frameworks, Editors, and More",
          ),
          onChanged: (value) {
            _searchResultsDisplayer.onChanged(value, searchProvider);
          },
          onSubmitted: (value) {
            _searchResultsDisplayer.onChanged(value, searchProvider);
          },
        ),
      ],
    );
  }
}
