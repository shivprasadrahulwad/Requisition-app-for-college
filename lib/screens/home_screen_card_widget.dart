import 'package:flutter/material.dart';

class UniversityCards extends StatelessWidget {
  const UniversityCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Modern color palette
    const colors = {
      'dean': Color(0xFF6C63FF),        // Deep purple-blue
      'registry': Color(0xFF4ECDC4),    // Turquoise
      'professors': Color(0xFFFF6B6B),  // Coral red
      'departments': Color(0xFFFFBE0B), // Vibrant yellow
      'requisition': Color(0xFF2AB7CA), // Ocean blue
    };

    // Card data with icons and descriptions
    final List<Map<String, dynamic>> cardData = [
      {
        'title': 'Dean',
        'icon': Icons.account_balance,
        'color': colors['dean'],
        'description': 'University administration and leadership',
      },
      {
        'title': 'Registry',
        'icon': Icons.how_to_reg,
        'color': colors['registry'],
        'description': 'Student records and registration',
      },
      {
        'title': 'Professors',
        'icon': Icons.school,
        'color': colors['professors'],
        'description': 'Faculty and academic staff',
      },
      {
        'title': 'Departments',
        'icon': Icons.business,
        'color': colors['departments'],
        'description': 'Academic departments and programs',
      },
      {
        'title': 'Requisition Form',
        'icon': Icons.description,
        'color': colors['requisition'],
        'description': 'Resource and material requests',
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: cardData.length,
        itemBuilder: (context, index) {
          final item = cardData[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
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
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 16.0,
                  ),
                  leading: Container(
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
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      item['description'],
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14,
                      ),
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
    );
  }
}