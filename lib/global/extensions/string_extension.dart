extension StringExtension on String {
  String capitalize() {
    return length > 0
        ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
        : '';
  }

  String enumToString(dynamic input) {
    return input.toString().split('.').last;
  }

  String enumToStringSingle(dynamic input) {
    return enumToString(input).split(RegExp('[A-Z]')).first;
  }

  bool isBlank(String input) {
    return input.trim().isEmpty;
  }

  String plural({required String text, required int value}) {
    if (value == 1) {
      return text;
    } else {
      return '$value ${text}s';
    }
  }
}
