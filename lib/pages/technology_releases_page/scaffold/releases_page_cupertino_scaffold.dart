import 'package:flutter/cupertino.dart';
import 'app_bars/releases_page_cupertino_app_bar.dart';

class ReleasesPageCupertinoScaffold extends StatelessWidget {
  const ReleasesPageCupertinoScaffold({
    required this.body,
    required this.technology,
    super.key,
  });
  final Widget body;
  final String technology;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: ReleasesPageCupertinoAppBar(
        technologyName: technology,
      ),
      child: SafeArea(bottom: false, child: body),
    );
  }
}