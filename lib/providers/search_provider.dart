import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  bool _searchResultsVisible = false;
  void showSearchResults() {
    _searchResultsVisible = true;
    notifyListeners();
  }

  void closeSearchResults() {
    _searchResultsVisible = false;
    notifyListeners();
  }

  bool get areSearchResultsVisible => _searchResultsVisible;

  List<String> _searchResults = [];
  List<String> get searchResults => _searchResults;
  
  set searchResults(List<String> results) {
    _searchResults = results;
    notifyListeners();
  }
}
