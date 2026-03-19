import 'package:flutter_test/flutter_test.dart';
import 'package:neat_utils/neat_utils.dart';

void main() {
  group('StringExtensions', () {
    test('isValidEmail returns true for valid emails', () {
      expect('test@example.com'.isValidEmail, isTrue);
      expect('user.name@domain.co'.isValidEmail, isTrue);
    });

    test('isValidEmail returns false for invalid emails', () {
      expect('test@example'.isValidEmail, isFalse);
      expect('test.com'.isValidEmail, isFalse);
      expect(''.isValidEmail, isFalse);
    });

    test('capitalize works correctly', () {
      expect('hello'.capitalize, 'Hello');
      expect('WORLD'.capitalize, 'WORLD');
      expect(''.capitalize, '');
    });

    test('truncate works correctly', () {
      expect('Hello World'.truncate(5), 'Hello...');
      expect('Hi'.truncate(5), 'Hi');
    });
  });

  group('Debouncer', () {
    test('runs action after delay', () async {
      final debouncer = Debouncer(milliseconds: 100);
      bool called = false;
      debouncer.run(() => called = true);
      expect(called, isFalse);
      await Future.delayed(const Duration(milliseconds: 150));
      expect(called, isTrue);
    });
  });
}
