class MyHelper {
  static String truncate(String source, int targetLength) {
    final trimmed = source.trim();
    final singleLine = trimmed.replaceAll('\n', ' ');
    if (singleLine.length > targetLength) {
      return '${singleLine.substring(0, targetLength - 3)}...';
    }

    return singleLine;
  }
}
