import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Student {
  final String name;
  final String rollNumber;
  final String course;

  const Student({
    required this.name,
    required this.rollNumber,
    required this.course,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Q17 Student Records',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
      home: const StudentRecordsScreen(),
    );
  }
}

class StudentRecordsScreen extends StatefulWidget {
  const StudentRecordsScreen({super.key});

  @override
  State<StudentRecordsScreen> createState() => _StudentRecordsScreenState();
}

class _StudentRecordsScreenState extends State<StudentRecordsScreen> {
  final nameController = TextEditingController();
  final rollController = TextEditingController();
  final courseController = TextEditingController();
  final searchController = TextEditingController();

  final List<Student> students = [
    Student(name: 'Aarav', rollNumber: '101', course: 'B.Tech CSE'),
    Student(name: 'Ananya', rollNumber: '102', course: 'B.Tech CSE'),
  ];

  String searchQuery = '';

  List<Student> get filteredStudents {
    return students
        .where(
          (student) =>
              student.name.toLowerCase().contains(searchQuery.toLowerCase()),
        )
        .toList();
  }

  void addStudent() {
    final name = nameController.text.trim();
    final roll = rollController.text.trim();
    final course = courseController.text.trim();

    if (name.isEmpty || roll.isEmpty || course.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    setState(() {
      students.add(Student(name: name, rollNumber: roll, course: course));
      nameController.clear();
      rollController.clear();
      courseController.clear();
    });

    FocusScope.of(context).unfocus();
  }

  void deleteStudent(Student student) {
    setState(() {
      students.remove(student);
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('${student.name} deleted')));
  }

  @override
  void dispose() {
    nameController.dispose();
    rollController.dispose();
    courseController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final visibleStudents = filteredStudents;

    return Scaffold(
      appBar: AppBar(title: const Text('Student Record List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Student Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: rollController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Roll Number',
                    prefixIcon: Icon(Icons.badge),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: courseController,
                  decoration: const InputDecoration(
                    labelText: 'Course',
                    prefixIcon: Icon(Icons.school),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: addStudent,
                    icon: const Icon(Icons.person_add),
                    label: const Text('Add Student'),
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: searchController,
                  onChanged: (value) =>
                      setState(() => searchQuery = value.trim()),
                  decoration: const InputDecoration(
                    labelText: 'Search by student name',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: visibleStudents.isEmpty
                ? const Center(child: Text('No students found'))
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                    itemCount: visibleStudents.length,
                    itemBuilder: (context, index) {
                      final student = visibleStudents[index];
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            child: Text(student.name[0].toUpperCase()),
                          ),
                          title: Text(student.name),
                          subtitle: Text(
                            'Roll No: ${student.rollNumber}\nCourse: ${student.course}',
                          ),
                          isThreeLine: true,
                          trailing: IconButton(
                            onPressed: () => deleteStudent(student),
                            icon: const Icon(Icons.delete),
                            tooltip: 'Delete',
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
