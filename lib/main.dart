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
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Three Buttons'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  print('Submit button pressed');
                },
                child: const Text('Submit'),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Reset button pressed');
                },
                child: const Text('Reset'),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Cancel button pressed');
                },
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}