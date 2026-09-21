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
      title: 'Q16 Search Filter',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.purple),
      home: const SearchFilterScreen(),
    );
  }
}

class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  final List<String> names = [
    'Aarav',
    'Ananya',
    'Rohan',
    'Priya',
    'Vikram',
    'Neha',
    'Karan',
    'Meera',
    'Rahul',
    'Sneha',
  ];

  String query = '';

  @override
  Widget build(BuildContext context) {
    final filteredNames = names
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Search Names')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) => setState(() => query = value),
              decoration: const InputDecoration(
                labelText: 'Search by name',
                hintText: 'Type a name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: filteredNames.isEmpty
                ? const Center(child: Text('No matching names'))
                : ListView.builder(
                    itemCount: filteredNames.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          child: Text(filteredNames[index][0]),
                        ),
                        title: Text(filteredNames[index]),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
