class MyHelper {
  static String truncate(String source, int targetLength) {
    if (source.length > targetLength) {
      return '${source.substring(0, targetLength - 3)}...';
    }

    return source;
  }
}
