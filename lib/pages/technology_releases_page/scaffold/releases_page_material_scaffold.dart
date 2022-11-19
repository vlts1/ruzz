import 'package:flutter/material.dart';

import 'app_bars/releases_page_material_app_bar.dart';

class ReleasesPageMaterialScaffold extends StatelessWidget {
  const ReleasesPageMaterialScaffold({
    required this.body,
    required this.technology,
    super.key,
  });
  final Widget body;
  final String technology;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReleasesPageMaterialAppBar(technology),
      body: SafeArea(
        child: body,
        bottom: false,
      ),
    );
  }
}
