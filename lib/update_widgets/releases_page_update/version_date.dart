import 'package:flutter/material.dart';
import 'package:ruzz/update_widgets/releases_page_update/ruzz_db_date_converter.dart';
import '../in_list_update/technology_update_info/text_styles/i_header_text_style.dart';
import '../in_list_update/technology_update_info/text_styles/technology_name_text_style.dart';
import '../in_list_update/technology_update_info/text_styles/version_number_text_style.dart';

class VersionDate extends StatelessWidget {
  VersionDate({
    required this.versionNumber,
    required this.ruzzDbReleaseDate,
    Key? key,
  }) : super(key: key);

  final String versionNumber;
  final String ruzzDbReleaseDate;

  final IHeaderTextStyle    _globalStyle        = TechnologyNameTextStyle();
  final IHeaderTextStyle    _versionNumberStyle = VersionNumberTextStyle ();
  final RuzzDbDateConverter _dateConverter      = RuzzDbDateConverter    ();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          versionNumber,
          style: _globalStyle.getStyle(context),
          textAlign: TextAlign.center,
        ),
        FittedBox(
          fit: BoxFit.fitHeight,
          child: Text(
            _dateConverter.convertToHumanFormat(ruzzDbReleaseDate),
            style: _versionNumberStyle.getStyle(context),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}