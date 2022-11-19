import '../../../local_db/release.dart';
import '../../../local_db/ruzz_db_date_to_date_time_adapter.dart';

class ReleasesSorter {
  void sort(List<Release> unsorted) {
    unsorted.sort(
      (a, b) => RuzzDbDateToDateTimeAdapter(b.releaseDate).compareTo(
        RuzzDbDateToDateTimeAdapter(a.releaseDate),
      ),
    );
  }
}
