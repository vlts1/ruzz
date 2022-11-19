import 'package:flutter/material.dart';
import 'package:ruzz/pages/home_page/updates_page/app_bar/updates_page_app_bar.dart';
import 'package:ruzz/themes/system_text_color.dart';


class TimeFrameSeparator extends StatelessWidget {
  const TimeFrameSeparator({required this.date, Key? key}) : super(key: key);
  final String date;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 0),
      margin: const EdgeInsets.only(
        left: UpdatesPageAppBar.navBarEdgePadding, 
        right: 20, 
        top: 21,
      ),
      child: Text(
        date,
        style: TextStyle(
          fontSize: 33,
          color: SystemTextColor.getColor(context),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
