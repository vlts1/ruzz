import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:ruzz/pages/home_page/scaffolds/bookmarks_page_cupertino_scaffold.dart';
import 'package:ruzz/pages/home_page/scaffolds/bookmarks_page_material_scaffold.dart';

class BookmarksPageScaffold extends StatelessWidget {
  const BookmarksPageScaffold({required this.body, super.key});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? BookmarksPageCupertinoScaffold(body: body)
        : BookmarksPageMaterialScaffold (body: body);
  }
}
