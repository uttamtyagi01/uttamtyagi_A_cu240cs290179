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
      title: 'Q3 ListView.builder',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: const NumberScreen(),
    );
  }
}

class NumberScreen extends StatelessWidget {
  const NumberScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Numbers 1 to 100')),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          final number = index + 1;
          return ListTile(
            leading: CircleAvatar(child: Text('$number')),
            title: Text('Number $number'),
          );
        },
      ),
    );
  }
}
