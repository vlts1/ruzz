import 'package:flutter/cupertino.dart';
import 'displayed_time_frames.dart';
import 'latest_loaded_update_index.dart';
import 'time_frame_specifier.dart';
import '../time_frame_separator_attacher/time_frame_separator_attacher.dart';
import 'time_frame_list_indexes.dart';

/// Used with [ListView] to group updates based on close release date
/// (today, yesterday, last week, last month, etc).
/// 
/// * User must create a new object each time the list is rebuilt.
/// 
/// See [TimeFrameSpecifier] for dates.
class UpdateListTimeFrameDivider {
  final _timeFrameSpecifier = TimeFrameSpecifier();
  final _separatorAttacher  = TimeFrameSeparatorAttacher();
  final _timeFrameIndexes   = TimeFrameListIndexes();
  final _assignedTimeFrames = AssignedTimeFrames();
  final _lastUpdateIndex    = LatestLoadedUpdateIndex();

  bool _isUpdateFirstTimeLoaded(int index) {
    return _lastUpdateIndex.index + 1 == index;
  }

  Widget updateWithTimeSeparator({
    required Widget update,
    required int index,
    required DateTime releaseDate,
  }) {
    final String timeFrame = _timeFrameSpecifier.getTimeFrame(releaseDate);

    if (_isUpdateFirstTimeLoaded(index)) {
      final bool isTimeFrameAssignedToUpdate = _assignedTimeFrames.isAssigned(timeFrame);

      if (isTimeFrameAssignedToUpdate == false) {
        _timeFrameIndexes.saveTimeFrameAtIndex(index, timeFrame);
        _assignedTimeFrames.markAsAssigned(timeFrame);
      }
      _lastUpdateIndex.setNewIndex(index);
    }

    if (_timeFrameIndexes.getTimeFrame(index) != TimeFrameListIndexes.emptyTimeFrame) {
      return _separatorAttacher.attachToUpdate(timeFrame, update);
    }
    return update;
  }
}
