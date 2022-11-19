import 'package:flutter/cupertino.dart';

abstract class IBookmarkIcon {
  // Get icon from its physical state (bookmarked/not bookmarked)
  Icon getIconFromState(bool isBookmarked, BuildContext context);
}
