import 'package:flutter/cupertino.dart';
import 'package:ruzz/pages/home_page/updates_page/app_bar_title_with_last_update_release_date/list_widget_y_position.dart';
import 'package:ruzz/pages/home_page/updates_page/app_bar_title_with_last_update_release_date/widget_visibility.dart';
import 'package:ruzz/pages/home_page/updates_page/release_date_group_divider/update_list_time_frame_divider/time_frame_specifier.dart';
import 'package:ruzz/pages/home_page/updates_page/updates_page.dart';

/// Sets the title of AppBar based on the current update widget that is
/// behind it, and the update's release date.
///
/// User must create a new object each time the list is rebuilt.

class ReleaseDateTitleSetter {
  ReleaseDateTitleSetter({
    required this.controller,
    required this.navigationBarHeight,
    required this.onTitleChangeCallback,
  });
  final ScrollController controller;
  final double navigationBarHeight;
  void Function(String title) onTitleChangeCallback;

  final _listWidgetYPosition = ListWidgetYPosition();
  final _timeFrameSpecifier  = TimeFrameSpecifier();
  final _widgetVisibility    = WidgetVisibility();
  int   _lastCheckedIndex    = -1;

  bool _isUpdatePartiallyCoveredByAppBar(double y) {
    return y < navigationBarHeight;
  }

  void titleFromUpdateBehindAppBar({
    required GlobalKey updateWidgetKey,
    required DateTime releaseDate,
    required int listIndex,
  }) {
    if (listIndex > _lastCheckedIndex) {
      controller.addListener(() {
        final isWidgetVisible = _widgetVisibility.isListWidgetVisible(updateWidgetKey);

        if (isWidgetVisible) {
          final y = _listWidgetYPosition.getY(updateWidgetKey);

          if (listIndex == 0) {
            onTitleChangeCallback(UpdatesPage.defaultTitle);
          }
          if (_isUpdatePartiallyCoveredByAppBar(y)) {
            // Must use [TimeFrameSpecifier], as it is used for determining
            // titles in [UpdateWithTimeFrameSeparator].
            final String newTitle = _timeFrameSpecifier.getTimeFrame(releaseDate);
            onTitleChangeCallback(newTitle);
          }
        }
      });
      _lastCheckedIndex = listIndex;
    }
  }
}
