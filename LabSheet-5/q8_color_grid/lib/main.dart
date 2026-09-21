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
      title: 'Q8 Color Grid',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const ColorGridScreen(),
    );
  }
}

class ColorGridScreen extends StatelessWidget {
  const ColorGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.amber,
      Colors.indigo,
      Colors.cyan,
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('GridView.builder - Colored Boxes')),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: colors.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: colors[index],
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: Text(
                'Box ${index + 1}',
                style: const TextStyle(
                  color: Colors.white,
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
