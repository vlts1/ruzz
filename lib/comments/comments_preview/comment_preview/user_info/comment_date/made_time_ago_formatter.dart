class MadeTimeAgoFormatter {
  final _currentTime = DateTime.now();

  String formattedDate(DateTime releaseDate) {
    String formattedDate = "A long time ago...";
    final difference = _currentTime.difference(releaseDate);

    final monthsAgo = _currentTime.month - releaseDate.month;
    final yearsAgo  = _currentTime.year  - releaseDate.year;

    if (difference.inDays <= 21) {
      if (difference.inDays <= 21) formattedDate = "3 weeks ago";
      if (difference.inDays >= 14) formattedDate = "2 weeks ago";
      if (difference.inDays >= 10) formattedDate = "A week ago";
      if (difference.inDays <  10) formattedDate = "${difference.inDays} days ago";
      if (difference.inDays == 1)  formattedDate = "Yesterday";
      if (difference.inDays <= 0)  formattedDate = "Today";
    } 
    else if (yearsAgo == 0 && monthsAgo > 0) {
      formattedDate = "$monthsAgo months ago";
      if (monthsAgo == 1) formattedDate = "A month ago";
    } 
    else if (yearsAgo > 0) {
      formattedDate = "$yearsAgo years ago";
      if (yearsAgo == 1) formattedDate = "Last year";
    }

    return formattedDate;
  }
}
