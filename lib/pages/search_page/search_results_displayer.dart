import 'package:flutter/cupertino.dart';
import 'package:ruzz/providers/search_provider.dart';

import 'page_states/search_technology_matches/search_algorithm/possible_technology_matches.dart';

class SearchResultsDisplayer {
  final _possibleTechnologyMatches = PossibleTechnologyMatches();
  
  void onChanged(String value, SearchProvider searchProvider) {
    searchProvider.showSearchResults();
    if (value.trim().isEmpty) return;
    searchProvider.searchResults = _possibleTechnologyMatches.possibleMatches(value);
  }

  void onSubmitted(String value, SearchProvider searchProvider) {
    onChanged(value, searchProvider);
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
