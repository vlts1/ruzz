import 'package:flutter/material.dart';
import 'text_styles/i_header_text_style.dart';
import 'text_styles/technology_name_text_style.dart';
import 'text_styles/version_number_text_style.dart';

class VersionTechnology extends StatelessWidget {
  VersionTechnology({
    required this.technologyName,
    required this.versionNumber,
    Key? key,
  }) : super(key: key);

  final String technologyName;
  final String versionNumber;

  final IHeaderTextStyle _globalStyle        = TechnologyNameTextStyle();
  final IHeaderTextStyle _versionNumberStyle = VersionNumberTextStyle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            technologyName,
            style: _globalStyle.getStyle(context),
          ),
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              technologyName == 'JavaScript' ? versionNumber : "Version " + versionNumber,
              style: _versionNumberStyle.getStyle(context),
            ),
          ),
        ],
      ),
    );
  }
}