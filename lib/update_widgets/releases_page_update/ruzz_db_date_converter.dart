import 'package:ruzz/local_db/ruzz_db_date_to_date_time_adapter.dart';

import 'package:intl/intl.dart';
class RuzzDbDateConverter {
  String convertToHumanFormat(String ruzzDbDate) {
    final DateTime date       = RuzzDbDateToDateTimeAdapter(ruzzDbDate);
    final String   humanMonth = DateFormat("MMMM").format(date);
    final String   intDate    = date.day .toString();
    final String   intYear    = date.year.toString(); 
    
    if (DateTime.now().year == date.year) {
      return humanMonth + " " + intDate;
    } 
    else {
      return humanMonth + " " + intDate + ", " + intYear;
    }
  }
}
