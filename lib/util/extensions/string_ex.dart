extension StringEx on String {
  /// Returns a string with an ellipsis if the string is longer than [limit].
  String ellipsis(int limit) {
    if (limit >= length) {
      return this;
    }
    return '${substring(0, limit)}...';
  }
}
