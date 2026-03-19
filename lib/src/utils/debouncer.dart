import 'dart:async';
import 'package:flutter/material.dart';

/// A utility class for debouncing actions like search field typing.
///
/// Example:
/// ```dart
/// final _debouncer = Debouncer(milliseconds: 500);
/// _debouncer.run(() => print('Fetch search results'));
/// ```
class Debouncer {
  /// The delay in milliseconds.
  final int milliseconds;

  /// The timer to handle the delay.
  Timer? _timer;

  /// Creates a [Debouncer] with the given [milliseconds].
  Debouncer({required this.milliseconds});

  /// Executes the given [action] after the [milliseconds] delay.
  /// If [run] is called again before the delay, the previous call is cancelled.
  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  /// Cancels any scheduled action.
  void dispose() {
    _timer?.cancel();
  }
}
