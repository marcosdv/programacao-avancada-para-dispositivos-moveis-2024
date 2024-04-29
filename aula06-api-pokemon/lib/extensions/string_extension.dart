extension StringExtension on String {

  int toInt({int vlrPadrao = 0}) {
    try {
      return int.parse(this);
    } on Exception catch (_) {
      return vlrPadrao;
    }
  }

  double toDouble({double vlrPadrao = 0}) {
    try {
      return double.parse(this);
    } on Exception catch (_) {
      return vlrPadrao;
    }
  }

}