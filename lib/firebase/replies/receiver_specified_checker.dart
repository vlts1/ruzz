import 'package:ruzz/firebase/comments/whitespace_checker/whitespace_checker.dart';

class ReceiverSpecifiedChecker {
  final _whitespaceChecker = WhitespaceChecker();
  
  bool isReceiverSpecified(String? receiverName, String? receiverId) {
    if (_whitespaceChecker.isAllWhitespace(receiverId))   return false;
    if (_whitespaceChecker.isAllWhitespace(receiverName)) return false;

    return true;
  }
}
