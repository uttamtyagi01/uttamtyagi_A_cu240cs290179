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
      title: 'Q2 ListTile',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.teal),
      home: const ListTileScreen(),
    );
  }
}

class ListTileScreen extends StatelessWidget {
  const ListTileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      ('Home', 'Go to the home screen', Icons.home),
      ('Profile', 'View your profile', Icons.person),
      ('Settings', 'Change app settings', Icons.settings),
      ('Notifications', 'Check recent alerts', Icons.notifications),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('ListTile Example')),
      body: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (_, __) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            leading: CircleAvatar(child: Icon(item.$3)),
            title: Text(item.$1),
            subtitle: Text(item.$2),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          );
        },
      ),
    );
  }
}
