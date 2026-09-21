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
      title: 'Q5 ListView.separated',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.orange),
      home: const SeparatedScreen(),
    );
  }
}

class SeparatedScreen extends StatelessWidget {
  const SeparatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const items = ['Milk', 'Bread', 'Eggs', 'Rice', 'Apples', 'Juice'];

    return Scaffold(
      appBar: AppBar(title: const Text('Separated List')),
      body: ListView.separated(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: Text(items[index]),
          );
        },
        separatorBuilder: (context, index) =>
            const Divider(thickness: 1, indent: 16, endIndent: 16),
      ),
    );
  }
}
