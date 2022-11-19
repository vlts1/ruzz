class LongWordsFewMatchesRemover {
  List<String> removeFewMatches(List<String> matches, String compareTo) {
    final notSoLongMatches = <String>[];
    
    for (String match in matches) {
      if (compareTo.trim().length <= match.length + 2) {
        notSoLongMatches.add(match);
      }
    }
    return notSoLongMatches;
  }
}
