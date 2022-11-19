class WhitespaceChecker {
  bool isAllWhitespace(String? string) {
    if (string == null || string == "") return true;
    if (string.trim() == "") return true;

    return false;
  }
}
