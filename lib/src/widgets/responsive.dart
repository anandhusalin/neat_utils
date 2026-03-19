import 'package:flutter/material.dart';

/// A widget that helps in building responsive layouts.
/// It provides different builders for mobile, tablet, and desktop.
class Responsive extends StatelessWidget {
  /// The widget to display on mobile devices.
  final Widget mobile;

  /// The widget to display on tablet devices.
  final Widget? tablet;

  /// The widget to display on desktop devices.
  final Widget? desktop;

  /// Creates a [Responsive] widget.
  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  /// Static method to check if the screen is mobile.
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  /// Static method to check if the screen is tablet.
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1200;

  /// Static method to check if the screen is desktop.
  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1200;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return desktop ?? tablet ?? mobile;
        } else if (constraints.maxWidth >= 600) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}
