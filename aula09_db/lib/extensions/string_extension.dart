extension StringExtension on String {
  int toInt({int vlrPadrao = 0}) {
    return int.tryParse(this) ?? vlrPadrao;
  }

  double toDouble({double vlrPadrao = 0}) {
    return double.tryParse(this) ?? vlrPadrao;
  }
}