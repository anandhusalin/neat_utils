import 'package:flutter/material.dart';

/// A simple widget to provide spacing in a [Column], [Row], or [Flex].
/// It automatically determines if it should use width or height based on its parent.
///
/// Example:
/// ```dart
/// Column(
///  children: [
///   Text('Top'),
///   Gap(16),
///   Text('Bottom'),
///  ],
/// )
/// ```
class Gap extends StatelessWidget {
  /// The amount of space to provide.
  final double size;

  /// Creates a [Gap] widget with the given [size].
  const Gap(this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size, height: size);
  }
}
