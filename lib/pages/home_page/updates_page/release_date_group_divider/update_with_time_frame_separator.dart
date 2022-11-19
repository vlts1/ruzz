import 'package:flutter/cupertino.dart';
import 'package:ruzz/pages/home_page/updates_page/release_date_group_divider/time_frame_separator.dart';

class UpdateWithTimeFrameSeparator extends StatelessWidget {
  const UpdateWithTimeFrameSeparator({
    required this.update,
    required this.separator,
    Key? key,
  }) : super(key: key);

  final Widget update;
  final TimeFrameSeparator separator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [separator, update],
    );
  }
}
