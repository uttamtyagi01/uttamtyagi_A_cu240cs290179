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
      title: 'Q7 Icon Grid',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const IconGridScreen(),
    );
  }
}

class IconGridScreen extends StatelessWidget {
  const IconGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const icons = [
      Icons.home,
      Icons.person,
      Icons.favorite,
      Icons.star,
      Icons.settings,
      Icons.camera_alt,
      Icons.phone,
      Icons.email,
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('GridView.count - Icons')),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: icons
            .map((icon) => Card(child: Center(child: Icon(icon, size: 56))))
            .toList(),
      ),
    );
  }
}
