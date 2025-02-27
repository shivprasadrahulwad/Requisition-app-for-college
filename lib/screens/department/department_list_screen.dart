import 'package:flutter/material.dart';
import 'package:mitaoe/screens/card_widget.dart';
import 'package:mitaoe/screens/dean/add_dean_screen.dart';
import 'package:mitaoe/screens/dean/dean_list_screen.dart';

class Department {
  final String name;
  final String department;
  final String emailId;
  final String phoneNumber;

  Department({
    required this.name,
    required this.department,
    required this.emailId,
    required this.phoneNumber,
  });
}

class DepartmentListScreen extends StatefulWidget {
  const DepartmentListScreen({Key? key}) : super(key: key);

  @override
  State<DepartmentListScreen> createState() => _DepartmentListScreenState();
}

class _DepartmentListScreenState extends State<DepartmentListScreen> {
  final List<Dean> deans = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          child: AppBar(
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
            title: const Text(
              'Departement',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Color(0xFFFFBE0B),
            elevation: 0, // Optional: Removes shadow to match the rounded look
          ),
        ),
      ),
      body: Column(
        children: [
          DisplayCard(
            name: "John Doe",
            email: "johndoe@example.com",
            department: "Computer Engineering",
          ),
          DisplayCard(
            name: "John Doe",
            email: "johndoe@example.com",
            department: "Information Technology",
          ),
          DisplayCard(
            name: "John Doe",
            email: "johndoe@example.com",
            department: "Electrical Engineering",
          ),
          const SizedBox(height: 16), // Spacing between DisplayCard and list
          Expanded(
            child: deans.isEmpty
                ? const Center(
                    child: Text('No deans added yet'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: deans.length,
                    itemBuilder: (context, index) {
                      final dean = deans[index];
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.only(bottom: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(16),
                          title: Text(
                            dean.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Text('Department: ${dean.department}'),
                              Text('Email: ${dean.emailId}'),
                              Text('Phone: ${dean.phoneNumber}'),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                deans.removeAt(index);
                              });
                            },
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFFBE0B),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDeanScreen(
                onDeanAdded: (dean) {
                  setState(() {
                    deans.add(dean);
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
