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
      title: 'Q14 Delete Item',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.red),
      home: const DeleteItemScreen(),
    );
  }
}

class DeleteItemScreen extends StatefulWidget {
  const DeleteItemScreen({super.key});

  @override
  State<DeleteItemScreen> createState() => _DeleteItemScreenState();
}

class _DeleteItemScreenState extends State<DeleteItemScreen> {
  final List<String> items = [
    'Laptop',
    'Keyboard',
    'Mouse',
    'Monitor',
    'Printer',
  ];

  void deleteItem(int index) {
    final deleted = items[index];
    setState(() => items.removeAt(index));

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$deleted deleted')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Delete Item')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: const Icon(Icons.inventory_2_outlined),
              title: Text(items[index]),
              trailing: IconButton(
                onPressed: () => deleteItem(index),
                icon: const Icon(Icons.delete),
                tooltip: 'Delete',
              ),
            ),
          );
        },
      ),
    );
  }
}
