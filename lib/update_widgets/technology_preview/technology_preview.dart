import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ruzz/providers/latest_technology_versions.dart';
import 'package:ruzz/update_widgets/in_list_update/technology_update_info/technology_logo.dart';
import 'package:ruzz/update_widgets/technology_preview/logo_tile.dart';
import 'package:ruzz/update_widgets/technology_preview/version_tile/version_tile.dart';
import '../../pages/technology_releases_page/technology_releases_page.dart';
import '../../themes/colors/technology_preview_logo_background.dart';
import 'decorations/elevated_decoration.dart';

class TechnologyPreview extends StatefulWidget {
  const TechnologyPreview({
    required this.technologyName,
    required this.logo,
    Key? key,
  }) : super(key: key);

  final String technologyName;
  final Widget logo;
  @override
  State<TechnologyPreview> createState() => _TechnologyPreviewState();
}

class _TechnologyPreviewState extends State<TechnologyPreview> {
  final backgroundColor = TechnologyPreviewLogoBackground();
  late LatestTechnologyVersions latestTechnologyVersions;

  @override
  void didChangeDependencies() {
    latestTechnologyVersions = Provider.of<LatestTechnologyVersions>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ModalRoute.of(context)?.settings.name == TechnologyReleasesPage.route) return;
        Navigator.of(context).pushNamed(
          TechnologyReleasesPage.route,
          arguments: widget.technologyName,
        );
      },
      child: Container(
        decoration: ElevatedDecoration(
          context,
          backgroundColor.fromTheme(context),
        ),
        child: Column(
          children: [
            /// Max size is set in [UpdatesSearch]
            const Spacer(flex: 2),
            Expanded(
              child: LogoTile(
                logo: TechnologyLogo(logoImage: widget.logo),
                technologyName: widget.technologyName,
              ),
              flex: 7,
            ),
            Expanded(
              child: VersionTile(
                latestTechnologyVersions.lastVersionOf(widget.technologyName),
              ),
              flex: 4,
            ),
          ],
        ),
      ),
    );
  }
}
