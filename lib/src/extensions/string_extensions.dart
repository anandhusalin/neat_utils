/// Extensions on [String] to provide common validation and formatting utilities.
extension StringExtensions on String {
  /// Checks if the string is a valid email address.
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  /// Checks if the string is a valid phone number (basic check).
  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?[0-9]{10,15}$");
    return phoneRegExp.hasMatch(this);
  }

  /// Capitalizes the first letter of the string.
  String get capitalize {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  /// Converts the string to a numeric value if possible, else returns null.
  num? get toNumeric {
    return num.tryParse(this);
  }

  /// Returns true if the string is numeric.
  bool get isNumeric => toNumeric != null;

  /// Truncates the string to a specified length and adds an ellipsis.
  String truncate(int maxLength) {
    if (length <= maxLength) return this;
    return "${substring(0, maxLength)}...";
  }

  /// Removes all whitespace from the string.
  String get removeWhitespace => replaceAll(RegExp(r'\s+'), '');
}
