import 'package:flutter/material.dart';
import 'package:mitaoe/screens/dean/dean_list_screen.dart';
import 'package:mitaoe/screens/department/department_list_screen.dart';
import 'package:mitaoe/screens/professors/professor_list_screen.dart';
import 'package:mitaoe/screens/registry/registry_list_screen.dart';
import 'package:mitaoe/screens/requisition_form_fill_screen.dart';

class UniversityHomeScreen extends StatelessWidget {
  const UniversityHomeScreen({Key? key}) : super(key: key);

  void _navigateToScreen(BuildContext context, String title) {
    Widget screen;
    switch (title) {
      case 'Dean':
        screen = const DeanListScreen();
        break;
      
      case 'Registry':
        screen = const RegistryListScreen();
        break;

      case 'Professors':
        screen = const ProfessorListScreen();
        break;

      case 'Departments':
        screen = const DepartmentListScreen();
        break;    

      case 'Requisition Form':
        screen = RequisitionFormFillScreen();
        break;    

      default:
        screen = Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Center(child: Text('$title Screen Coming Soon')),
        );
    }

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom gradient background
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFF8F9FA), // Light background gradient
              Color(0xFFE9ECEF),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom App Bar
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'University Portal',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2D3436),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Welcome back, Admin',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF636E72),
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundColor: const Color(0xFF6C63FF),
                      radius: 24,
                      child: IconButton(
                        icon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Handle profile button press
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Quick Stats Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Enables horizontal scrolling
                  child: Row(
                    children: [
                      _buildQuickStat(
                        icon: Icons.school,
                        label: 'Faculty',
                        value: '180',
                      ),
                      const SizedBox(width: 16), // Add spacing between items
                      _buildQuickStat(
                        icon: Icons.business,
                        label: 'Departments',
                        value: '12',
                      ),
                      const SizedBox(width: 16), // Add spacing between items
                      _buildQuickStat(
                        icon: Icons.person,
                        label: 'Deans',
                        value: '7',
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Section Title
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quick Access',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2D3436),
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: Color(0xFF6C63FF),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Cards List
              // const Expanded(
              //   child: UniversityCards(),  // Using the previously created cards component
              // ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final List<Map<String, dynamic>> items = [
                      {
                        'title': 'Dean',
                        'icon': Icons.account_balance,
                        'color': const Color(0xFF6C63FF),
                      },
                      {
                        'title': 'Registry',
                        'icon': Icons.how_to_reg,
                        'color': const Color(0xFF4ECDC4),
                      },
                      {
                        'title': 'Professors',
                        'icon': Icons.school,
                        'color': const Color(0xFFFF6B6B),
                      },
                      {
                        'title': 'Departments',
                        'icon': Icons.business,
                        'color': const Color(0xFFFFBE0B),
                      },
                      {
                        'title': 'Requisition Form',
                        'icon': Icons.description,
                        'color': const Color(0xFF2AB7CA),
                      },
                    ];

                    final item = items[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.only(bottom: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: InkWell(
                        onTap: () => _navigateToScreen(context, item['title']),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                item['color'],
                                item['color'].withOpacity(0.8),
                              ],
                            ),
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading:
                                // Icon(
                                //   item['icon'],
                                //   color: Colors.white,
                                //   size: 32,
                                // ),
                                Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                item['icon'],
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                            title: Text(
                              item['title'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF6C63FF),
        unselectedItemColor: const Color(0xFF636E72),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildQuickStat({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return SizedBox(
      width: 180,
      height: 80,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: const Color(0xFF6C63FF),
              size: 28, // Slightly larger for visibility
            ),

            const SizedBox(width: 20), // Space between icon and text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text left
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center text vertically
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF636E72),
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2D3436),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
