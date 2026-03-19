import 'package:flutter/material.dart';
import 'package:neat_utils/neat_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neat Utils Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DemoHome(),
    );
  }
}

class DemoHome extends StatefulWidget {
  const DemoHome({super.key});

  @override
  State<DemoHome> createState() => _DemoHomeState();
}

class _DemoHomeState extends State<DemoHome> {
  final _emailController = TextEditingController();
  final _searchController = TextEditingController();
  final _debouncer = Debouncer(milliseconds: 500);
  String? _emailError;
  String _searchResult = "";

  @override
  void dispose() {
    _emailController.dispose();
    _searchController.dispose();
    _debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Neat Utils Demo'),
        backgroundColor: context.colorScheme.primaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Context Extensions Section
            Text('Context Extensions', style: context.textTheme.headlineSmall),
            const Gap(8),
            Text('Screen Width: ${context.screenWidth.toStringAsFixed(2)}'),
            Text('Is Mobile: ${!context.isTablet && !context.isDesktop}'),
            const Gap(16),
            ElevatedButton(
              onPressed: () => context.showSnackBar('This is a neat snackbar!'),
              child: const Text('Show SnackBar'),
            ),
            const Gap(24),

            // String Extensions Section
            Text('String Extensions', style: context.textTheme.headlineSmall),
            const Gap(8),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email Validation',
                errorText: _emailError,
                border: const OutlineInputBorder(),
              ),
              onChanged: (val) {
                setState(() {
                  _emailError = val.isValidEmail ? null : 'Invalid Email';
                });
              },
            ),
            const Gap(24),

            // Debouncer Section
            Text(
              'Debouncer (Search Example)',
              style: context.textTheme.headlineSmall,
            ),
            const Gap(8),
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Type to search...',
                border: OutlineInputBorder(),
              ),
              onChanged: (val) {
                _debouncer.run(() {
                  setState(() {
                    _searchResult = "Searching for: $val";
                  });
                });
              },
            ),
            const Gap(8),
            Text(
              _searchResult,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const Gap(24),

            // Responsive Section
            Text('Responsive Widget', style: context.textTheme.headlineSmall),
            const Gap(8),
            const Responsive(
              mobile: Card(
                color: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Mobile Layout',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              tablet: Card(
                color: Colors.greenAccent,
                child: Padding(
                  padding: EdgeInsets.all(32.0),
                  child: Text(
                    'Tablet Layout',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
