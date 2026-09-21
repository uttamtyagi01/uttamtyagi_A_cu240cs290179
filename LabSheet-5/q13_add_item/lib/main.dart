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
      title: 'Q13 Add Item',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: const AddItemScreen(),
    );
  }
}

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final controller = TextEditingController();
  final List<String> items = ['Apple', 'Banana', 'Mango'];

  void addItem() {
    final text = controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      items.add(text);
      controller.clear();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add New Item')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onSubmitted: (_) => addItem(),
                    decoration: const InputDecoration(
                      labelText: 'Enter item',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: addItem, child: const Text('Add')),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.check_circle_outline),
                  title: Text(items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
