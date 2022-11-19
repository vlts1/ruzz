
class TimeFrameSpecifier {
  String getTimeFrame(DateTime releaseDate) {
    final currentTime = DateTime.now();

    String closestDate = "Ancient";
    if (releaseDate.year == currentTime.year) {
      closestDate = "Last Year";
      if (releaseDate.month + 6 >= currentTime.month) {
        closestDate = "Last Six Month";
        if (releaseDate.month + 3 >= currentTime.month) {
          closestDate = "Last Three Month";
          if (releaseDate.month + 1 >= currentTime.month) {
            closestDate = "Last Month";
            if (releaseDate.day + 7 >= currentTime.day && releaseDate.month == currentTime.month) {
              closestDate = "Last Week";
              if (releaseDate.day + 1 >= currentTime.day) {
                closestDate = "Yesterday";
                if (releaseDate.day >= currentTime.day) {
                  closestDate = "Today";
                }
              }
            }
          }
        }
      }
    }
    return closestDate;
  }
}
