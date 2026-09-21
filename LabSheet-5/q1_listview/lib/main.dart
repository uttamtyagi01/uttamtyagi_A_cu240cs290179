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
      title: 'Q1 ListView',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const ListScreen(),
    );
  }
}

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const items = ['Apple', 'Banana', 'Orange', 'Mango', 'Grapes'];

    return Scaffold(
      appBar: AppBar(title: const Text('Five Items - ListView')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: items
            .map(
              (item) => Card(
                child: ListTile(
                  leading: const Icon(Icons.list),
                  title: Text(item),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
