import 'package:flutter/cupertino.dart';
import 'package:ruzz/pages/user_profile/options/delete_account_tim_cook_request.dart';
import 'package:ruzz/pages/user_profile/options/options_title.dart';
import 'option_separator.dart';
import 'logout_option.dart';

class OptionsList extends StatefulWidget {
  const OptionsList({Key? key}) : super(key: key);

  @override
  State<OptionsList> createState() => _OptionsListState();
}

class _OptionsListState extends State<OptionsList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const OptionsTitle(),
          const SizedBox(height: 15),
          LogoutOption(),
          const OptionSeparator(),
          DeleteAccountTimCookRequest(),
          const OptionSeparator(),
        ],
      ),
    );
  }
}
