# neat_utils

A lightweight and essential Flutter utility package designed to reduce boilerplate and speed up development.

## Features

- **Context Extensions**: Navigation (`push`, `pop`), Theme access, MediaQuery shortcuts.
- **String Extensions**: Validation (`isValidEmail`, `isValidPhone`), Formatting (`capitalize`, `truncate`).
- **Gap Widget**: Simple spacing in Columns/Rows without manual `SizedBox`.
- **Responsive Layout**: Adaptive widgets for Mobile, Tablet, and Desktop.
- **Debouncer**: Easy searching/typing delay management.

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  neat_utils: ^0.1.0
```

Or run:

```bash
flutter pub add neat_utils
```

## Usage

### Context Extensions
```dart
// Navigation
context.push(const ProfilePage());
context.pop();

// UI Shortcuts
bool isDark = context.isDarkMode;
double width = context.screenWidth;
context.showSnackBar('Hello!');
```

### String Extensions
```dart
if ("test@mail.com".isValidEmail) {
  print("Valid email!");
}

String name = "john".capitalize; // "John"
```

### Gap Widget
```dart
Column(
  children: [
    Text('Top'),
    Gap(20), // Instead of SizedBox(height: 20)
    Text('Bottom'),
  ],
)
```

### Responsive Widget
```dart
Responsive(
  mobile: MobileView(),
  tablet: TabletView(),
  desktop: DesktopView(),
)
```

### Debouncer
```dart
final _debouncer = Debouncer(milliseconds: 500);

onChanged: (value) {
  _debouncer.run(() {
    print('Search for $value');
  });
}
```

## License
MIT
