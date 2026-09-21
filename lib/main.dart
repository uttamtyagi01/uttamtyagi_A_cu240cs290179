import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: StudentManagementApp()));

class StudentManagementApp extends StatefulWidget {
  @override
  _StudentManagementAppState createState() => _StudentManagementAppState();
}

class _StudentManagementAppState extends State<StudentManagementApp> {
  int index = 0;

  final screens = [
    Center(child: Text("Home Screen", style: TextStyle(fontSize: 24))),
    Center(child: Text("Student Profile", style: TextStyle(fontSize: 24))),
    Center(child: Text("Attendance Records", style: TextStyle(fontSize: 24))),
    Center(child: Text("Result Details", style: TextStyle(fontSize: 24))),
  ];

  final titles = ["Home", "Profile", "Attendance", "Result"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(titles[index])),
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.checklist), label: "Attendance"),
          BottomNavigationBarItem(icon: Icon(Icons.grade), label: "Result"),
        ],
      ),
    );
  }
}
