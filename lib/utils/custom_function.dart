abstract class CustomFunction {
  static bool isNotEmpty(String value) {
    final trimmedValue = value.trim();
    return trimmedValue.isNotEmpty;
  }

  static bool isValidEmail(String email) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return regex.hasMatch(email);
  }

  static bool validateNumberOnly(String value) {
    if (value.isEmpty) {
      return false;
    } else {
      return RegExp(r'^-?[0-9]+$').hasMatch(value);
    }
  }
}
