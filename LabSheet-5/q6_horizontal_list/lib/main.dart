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
      title: 'Q6 Horizontal List',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.green),
      home: const HorizontalListScreen(),
    );
  }
}

class HorizontalListScreen extends StatelessWidget {
  const HorizontalListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const items = ['Home', 'Profile', 'Messages', 'Settings', 'Help'];

    return Scaffold(
      appBar: AppBar(title: const Text('Horizontal Scrolling List')),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: const EdgeInsets.only(right: 12),
            decoration: BoxDecoration(
              color: Colors.green.shade100,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                items[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
