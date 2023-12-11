extension StringExtension on String {
  String capitalize() {
    if (length == 0) {
      return this;
    }
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
