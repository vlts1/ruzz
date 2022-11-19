class RuzzDbDateToDateTimeAdapter extends DateTime {
  static const _dummySecond = 1;
  RuzzDbDateToDateTimeAdapter(ruzzDbDate)
      : super(
          _getDateYear (ruzzDbDate),
          _getDateMonth(ruzzDbDate),
          _getDateDay  (ruzzDbDate),

          //! FIXME
          /// Without the _dummySecond firebase will not compare the dates correctly.
          /// Firestore queries will see the local dates as "older".
          /// If the app ever starts using hours/minutes for release dates --
          /// this would need to be changed.
          0,
          _dummySecond,
        );

  static int _getDateYear(String ruzzDbDate) {
    int year = int.parse(ruzzDbDate.substring(0, ruzzDbDate.indexOf('-')));
    return year;
  }

  static int _getDateMonth(String ruzzDbDate) {
    ruzzDbDate = ruzzDbDate.substring(ruzzDbDate.indexOf('-') + 1);
    int month = int.parse(ruzzDbDate.substring(0, ruzzDbDate.indexOf('-')));
    return month;
  }

  static int _getDateDay(String ruzzDbDate) {
    ruzzDbDate = ruzzDbDate.substring(ruzzDbDate.lastIndexOf('-') + 1);
    return int.parse(ruzzDbDate);
  }
}
