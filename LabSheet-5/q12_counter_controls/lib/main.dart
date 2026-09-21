import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Q12 Counter Controls',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orange),
      home: const CounterControlsScreen(),
    );
  }
}

class CounterControlsScreen extends StatefulWidget {
  const CounterControlsScreen({super.key});

  @override
  State<CounterControlsScreen> createState() => _CounterControlsScreenState();
}

class _CounterControlsScreenState extends State<CounterControlsScreen> {
  int count = 0;

  void changeCount(int value) {
    setState(() {
      count += value;
    });
  }

  void resetCount() {
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Increment, Decrement, Reset')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$count',
              style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () => changeCount(1),
                  icon: const Icon(Icons.add),
                  label: const Text('Increment'),
                ),
                ElevatedButton.icon(
                  onPressed: count > 0 ? () => changeCount(-1) : null,
                  icon: const Icon(Icons.remove),
                  label: const Text('Decrement'),
                ),
                OutlinedButton.icon(
                  onPressed: resetCount,
                  icon: const Icon(Icons.restart_alt),
                  label: const Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
