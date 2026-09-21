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
      title: 'Q15 Dismissible',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepOrange),
      home: const DismissibleScreen(),
    );
  }
}

class DismissibleScreen extends StatefulWidget {
  const DismissibleScreen({super.key});

  @override
  State<DismissibleScreen> createState() => _DismissibleScreenState();
}

class _DismissibleScreenState extends State<DismissibleScreen> {
  final List<String> items = ['Task 1', 'Task 2', 'Task 3', 'Task 4', 'Task 5'];

  void removeItem(int index) {
    final removedItem = items[index];
    setState(() => items.removeAt(index));

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$removedItem removed')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Swipe to Remove')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: ValueKey(item),
            direction: DismissDirection.endToStart,
            background: Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 24),
              color: Colors.red,
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (_) => removeItem(index),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              child: ListTile(
                leading: const Icon(Icons.task_alt),
                title: Text(item),
                subtitle: const Text('Swipe left to remove'),
              ),
            ),
          );
        },
      ),
    );
  }
}
