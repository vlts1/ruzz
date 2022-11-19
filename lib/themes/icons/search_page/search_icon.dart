import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:ruzz/themes/icons/search_page/android_search_icon.dart';
import 'package:ruzz/themes/icons/search_page/ios_search_icon.dart';

class SearchIcon extends StatelessWidget {
  const SearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS ? const IosSearchIcon() : const AndroidSearchIcon();
  }
}
