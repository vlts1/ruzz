import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/search_page/search_results_displayer.dart';
import '../../providers/search_provider.dart';

class IosSearch extends StatefulWidget {
  IosSearch({super.key});

  @override
  State<IosSearch> createState() => _IosSearchState();
}

class _IosSearchState extends State<IosSearch> {
  final _searchResultsDisplayer = SearchResultsDisplayer();
  late SearchProvider searchProvider;
  @override
  void didChangeDependencies() {
    searchProvider = Provider.of<SearchProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CupertinoNavigationBar(
          border: Border(),
          middle: Text("Search"),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
          child: CupertinoSearchTextField(
            placeholder: "Languages, Frameworks, Editors, and More",
            onChanged: (String value) {
              _searchResultsDisplayer.onChanged(value, searchProvider);
            },
            onSubmitted: (String value) {
              _searchResultsDisplayer.onChanged(value, searchProvider);
            },
          ),
        ),
      ],
    );
  }
}
