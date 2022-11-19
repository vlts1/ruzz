import 'huge_input_error_handler.dart';
import 'short_input_error_handler.dart';

class NameInputErrorHandler {
  final _hugeInputHandler = HugeInputErrorHandler();
  final _shortInputHandler = ShortInputErrorHandler();

  bool didHandleUnsupportedInput(String input, context) {
    if (_hugeInputHandler .didDisplayErrorMessage(input, context)) return true;
    if (_shortInputHandler.didDisplayErrorMessage(input, context)) return true;
    return false;
  }
}
