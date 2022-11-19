import 'package:flutter/cupertino.dart';

class BookmarksPageCupertinoScaffold extends StatelessWidget {
  const BookmarksPageCupertinoScaffold({required this.body, super.key});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        previousPageTitle: "Updates",
        middle: Text("Bookmarks"),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: body,
      ),
    );
  }
}