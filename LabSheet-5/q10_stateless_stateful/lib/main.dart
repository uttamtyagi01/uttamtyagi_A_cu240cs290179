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
      title: 'Q10 Stateless vs Stateful',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const ComparisonScreen(),
    );
  }
}

class ComparisonScreen extends StatelessWidget {
  const ComparisonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateless vs Stateful')),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('StatelessWidget'),
                subtitle: Text('This text does not change by itself.'),
                leading: Icon(Icons.lock_outline),
              ),
            ),
            SizedBox(height: 20),
            Card(child: StatefulCounter()),
          ],
        ),
      ),
    );
  }
}

class StatefulCounter extends StatefulWidget {
  const StatefulCounter({super.key});

  @override
  State<StatefulCounter> createState() => _StatefulCounterState();
}

class _StatefulCounterState extends State<StatefulCounter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          title: Text('StatefulWidget'),
          subtitle: Text('The counter changes using setState().'),
          leading: Icon(Icons.refresh),
        ),
        Text(
          '$count',
          style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () => setState(() => count++),
          child: const Text('Increase'),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
