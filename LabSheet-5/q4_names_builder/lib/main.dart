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
      title: 'Q4 Names',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.purple),
      home: const NamesScreen(),
    );
  }
}

class NamesScreen extends StatelessWidget {
  const NamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final names = [
      'Aarav',
      'Ananya',
      'Rohan',
      'Priya',
      'Vikram',
      'Neha',
      'Karan',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Names from Dart List')),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(child: Text(names[index][0])),
            title: Text(names[index]),
          );
        },
      ),
    );
  }
}
