extension SeparatedString on String {
  String get separatedString {
    List<String> substrings = [];

    for (int i = 0; i < length; i += 3) {
      int endIndex = i + 3;
      if (endIndex > length) {
        endIndex = length;
      }
      substrings.add(substring(i, endIndex));
    }
    return substrings.join(' ');
  }
}
