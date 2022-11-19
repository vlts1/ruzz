/// Stores time frames and indexes of updates, above which the time frames
/// will be displayed.

class TimeFrameListIndexes {
  static const emptyTimeFrame = "";
  final Map<int, String> _updateIndexToTimeFrame = {};

  void saveTimeFrameAtIndex(int index, String timeFrame) {
    if (index < 0) return;
    if (_updateIndexToTimeFrame.containsKey(index)) return;
    if (timeFrame == emptyTimeFrame) return;
    
    _updateIndexToTimeFrame[index] = timeFrame;
  }

  String getTimeFrame(int updateIndex) {
    if (_updateIndexToTimeFrame.containsKey(updateIndex) == false) {
      return emptyTimeFrame;
    }
    return _updateIndexToTimeFrame[updateIndex]!;
  }
}
