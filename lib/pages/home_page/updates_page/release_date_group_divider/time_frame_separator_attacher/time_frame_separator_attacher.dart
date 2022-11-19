import 'package:flutter/cupertino.dart';
import 'package:ruzz/pages/home_page/updates_page/release_date_group_divider/update_with_time_frame_separator.dart';
import '../time_frame_separator.dart';

class TimeFrameSeparatorAttacher {
  Widget attachToUpdate(String timeFrame, Widget update) {
    final separator = TimeFrameSeparator(date: timeFrame);
    return UpdateWithTimeFrameSeparator(update: update, separator: separator);
  }
}
