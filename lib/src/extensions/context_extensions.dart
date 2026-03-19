import 'package:flutter/material.dart';

/// Extensions on [BuildContext] to simplify common tasks like navigation,
/// accessing [MediaQuery], and [Theme].
extension ContextExtensions on BuildContext {
  /// Returns the [MediaQueryData] of the current context.
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Returns the width of the screen.
  double get screenWidth => mediaQuery.size.width;

  /// Returns the height of the screen.
  double get screenHeight => mediaQuery.size.height;

  /// Returns the padding of the screen.
  EdgeInsets get screenPadding => mediaQuery.padding;

  /// Returns the [ThemeData] of the current context.
  ThemeData get theme => Theme.of(this);

  /// Returns the [TextTheme] of the current context.
  TextTheme get textTheme => theme.textTheme;

  /// Returns the [ColorScheme] of the current context.
  ColorScheme get colorScheme => theme.colorScheme;

  /// Simple navigation to a new screen.
  Future<T?> push<T>(Widget page) {
    return Navigator.of(
      this,
    ).push<T>(MaterialPageRoute(builder: (context) => page));
  }

  /// Replace current screen with a new one.
  Future<T?> pushReplacement<T, TO>(Widget page) {
    return Navigator.of(
      this,
    ).pushReplacement<T, TO>(MaterialPageRoute(builder: (context) => page));
  }

  /// Pop the current screen.
  void pop<T>([T? result]) => Navigator.of(this).pop<T>(result);

  /// Show a simple SnackBar.
  void showSnackBar(String message, {Duration? duration}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration ?? const Duration(seconds: 2),
      ),
    );
  }

  /// Check if the screen is in dark mode.
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Check if the screen width is greater than a certain threshold (e.g., tablet).
  bool get isTablet => screenWidth >= 600;

  /// Check if the screen width is greater than a desktop threshold.
  bool get isDesktop => screenWidth >= 1200;
}
