/// Saves the time frames that have been assigned to a certain list index
class AssignedTimeFrames {
  final List<String> _assTimeFrames = [];
  bool isAssigned(String timeFrame) => _assTimeFrames.contains(timeFrame);
  void markAsAssigned(String timeFrame) {
    if (_assTimeFrames.contains(timeFrame) == false) {
      _assTimeFrames.add(timeFrame);
    }
  }
}
