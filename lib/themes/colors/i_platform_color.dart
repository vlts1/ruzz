import 'package:flutter/material.dart';

/// Interface for classes that require context for receiving system dependent
/// colors.
abstract class IPlatformColor {
  Color fromTheme(BuildContext context);
}
