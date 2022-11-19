import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/pages/page_refresh_indicator.dart';
import 'package:ruzz/providers/latest_technology_versions.dart';
import '../../../../local_db/supported_technologies.dart';
import '../../../../local_db/technology_logotypes.dart';
import '../../../../update_widgets/technology_preview/technology_preview.dart';

class TechnologyPreviews extends StatefulWidget {
  const TechnologyPreviews({required this.scrollController, super.key});
  final ScrollController scrollController;
  @override
  State<TechnologyPreviews> createState() => _TechnologyPreviewsState();
}

class _TechnologyPreviewsState extends State<TechnologyPreviews> {
  final logos = TechnologyLogotypes();
  final technologies = SupportedTechnologies.technologiesToLogos.keys.toList();
  late LatestTechnologyVersions latestTechnologyVersions;

  @override
  void didChangeDependencies() {
    latestTechnologyVersions = Provider.of<LatestTechnologyVersions>(
      context,
      // Individual technology widgets are already listening
      listen: false,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scrollbar(
        controller: widget.scrollController,
        child: PageRefreshIndicator(
          onRefresh: latestTechnologyVersions.fetchLatestVersions,
          child: GridView.builder(
            controller: widget.scrollController,
            padding: const EdgeInsets.only(top: 18, bottom: 18),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:  2,
              mainAxisSpacing: 30,
              mainAxisExtent:  200,
            ),
            itemBuilder: (context, id) {
              final technology = technologies[id];
              return Padding(
                padding: EdgeInsets.only(
                  left:  id % 2 == 0 ? 20 : 12.5,
                  right: id % 2 == 0 ? 12.5 : 20,
                ),
                child: TechnologyPreview(
                  technologyName: technology,
                  logo: logos.logoOf(technology),
                ),
              );
            },
            itemCount: technologies.length,
          ),
        ),
      ),
    );
  }
}
