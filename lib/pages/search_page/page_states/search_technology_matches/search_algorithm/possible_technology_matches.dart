import 'package:ruzz/local_db/supported_technologies.dart';
import 'package:ruzz/pages/search_page/page_states/search_technology_matches/search_algorithm/long_words_few_matches_remover.dart';
import 'package:ruzz/pages/search_page/page_states/search_technology_matches/search_algorithm/match_sorter.dart';

import 'match_counter.dart';

class PossibleTechnologyMatches {
  final _technologies = SupportedTechnologies.technologiesToLogos.keys.toList();
  final _matchCounter = MatchCounter();
  final _matchSorter  = MatchSorter();
  final _longWordsFewMatchesRemover = LongWordsFewMatchesRemover();

  List<String> possibleMatches(String searchQuery) {
    searchQuery = searchQuery.toLowerCase();

    Map<String, int> matches = _matchCounter.elementsWithMatches(
      _technologies,
      searchQuery,
    );
    if (matches.isEmpty) return [];

    final List<String> orderedMatches = _matchSorter.orderedMatches(matches);
    final correctMatches = _longWordsFewMatchesRemover.removeFewMatches(
      orderedMatches,
      searchQuery,
    );

    return correctMatches;
  }
}
