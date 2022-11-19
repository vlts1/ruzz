import 'package:flutter/material.dart';

class MatchCounter {
  Map<String, int> elementsWithMatches(List<String> words, String compareTo) {
    final Map<String, int> matches = {};

    for (final String word in words) {
      int matchingChars = 0;
      for (final String char in compareTo.characters) {
        if (word.toLowerCase().contains(char)) {
          matchingChars++;
        }
      }
      if (matchingChars != 0) {
        matches[word] = matchingChars;
      }
    }
    
    return matches;
  }
}
