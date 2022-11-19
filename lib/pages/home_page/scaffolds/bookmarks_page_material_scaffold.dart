import 'package:flutter/material.dart';

class BookmarksPageMaterialScaffold extends StatelessWidget {
  const BookmarksPageMaterialScaffold({required this.body, super.key});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bookmarks"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: body,
      ),
    );
  }
}
