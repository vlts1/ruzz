class MembershipLength {
  final _currentTime = DateTime.now();

  String userMemberFor(DateTime joinDate) {
    String formattedDate = "Member for a very long time...";

    final difference = _currentTime.difference(joinDate);

    final monthsAgo = _currentTime.month - joinDate.month;
    final yearsAgo  = _currentTime.year  - joinDate.year;

    if (difference.inDays <= 21) {
      if (difference.inDays <= 21) formattedDate = "Member for 3 weeks";
      if (difference.inDays >= 14) formattedDate = "Member for 2 weeks";
      if (difference.inDays >= 10) formattedDate = "Member for a week";
      if (difference.inDays <  10) formattedDate = "Member for ${difference.inDays} days";
      if (difference.inDays == 1)  formattedDate = "Member for a day";
      if (difference.inDays <= 0)  formattedDate = "Joined Today";
    }
    else if (yearsAgo == 0) {
      formattedDate = "Member for $monthsAgo months";
      if (monthsAgo == 1) formattedDate = "Member for a month";
    }
    else if (yearsAgo > 0) {
      formattedDate = "Member for $yearsAgo years";
      if (yearsAgo == 1) formattedDate = "Member for a year";
    }

    return formattedDate;
  }
}