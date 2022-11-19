class MatchSorter {
  List<String> orderedMatches(Map<String, int> matchesToCount) {
    final List<int> mostToLeastMatchingChars = matchesToCount.values.toList()..sort();
    
    final List<String> orderedMatches = [];
    for (int countId = 0; countId < mostToLeastMatchingChars.length; countId++) {
      final firstMatch = matchesToCount.entries
          .firstWhere(
            (match) => match.value == mostToLeastMatchingChars[countId],
          )
          .key;
      orderedMatches.add(firstMatch);
      // Some matches can have the same amount of matching characters.
      // With this line they will not be iterated through twice.
      matchesToCount[firstMatch] = 0;
    }

    return orderedMatches.reversed.toList();
  }
}
