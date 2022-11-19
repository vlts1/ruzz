import 'package:flutter/cupertino.dart';
import 'package:ruzz/update_widgets/followable_technology/followable_technology_logo.dart';
import 'package:ruzz/update_widgets/followable_technology/technology_description.dart';
import '../../comments/comments_page/comment/update_info.dart';
import '../../pages/technology_releases_page/technology_releases_page.dart';
import 'background_tile.dart';
import 'track_technology_button.dart';

class FollowableTechnology extends StatefulWidget {
  const FollowableTechnology({
    Key? key,
    required this.technologyInfo,
    required this.logo,
  }) : super(key: key);

  final UpdateInfo technologyInfo;
  final Widget logo;
  @override
  State<FollowableTechnology> createState() => _FollowableTechnologyState();
}

class _FollowableTechnologyState extends State<FollowableTechnology> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ModalRoute.of(context)?.settings.name == TechnologyReleasesPage.route) {
          return;
        }
        Navigator.of(context).pushNamed(
          TechnologyReleasesPage.route,
          arguments: widget.technologyInfo.technology,
        );
      },
      child: BackgroundTile(
        child: Row(
          children: [
            FollowableTechnologyLogo(logo: widget.logo),
            const SizedBox(width: 15),
            TechnologyDescription(technologyInfo: widget.technologyInfo),
            const Spacer(),
            TrackTechnologyButton(widget.technologyInfo.technology),
          ],
        ),
      ),
    );
  }
}