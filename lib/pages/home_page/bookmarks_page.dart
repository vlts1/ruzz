import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/home_page/scaffolds/bookmarks_page_scaffold.dart';
import 'package:ruzz/providers/bookmarks.dart';
import 'package:ruzz/update_widgets/bookmarks_list_update/bookmarked_only_list_update.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({Key? key}) : super(key: key);
  static const route = "/bookmarks";

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  late Bookmarks _bookmarksProvider;

  @override
  void didChangeDependencies() {
    _bookmarksProvider = Provider.of<Bookmarks>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BookmarksPageScaffold(
      body: ListView.builder(
        itemCount: _bookmarksProvider.bookmarks.length,
        itemBuilder: (context, index) {
          final release = _bookmarksProvider.bookmarks[index];
          return BookmarkedOnlyListUpdate(release: release);
        },
      ),
    );
  }
}