import 'package:flutter/material.dart';

// class DisplayCard extends StatelessWidget {
//   final String name;
//   final String email;
//   final String department;

//   const DisplayCard({
//     Key? key,
//     required this.name,
//     required this.email,
//     required this.department,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 4,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: 8,
//             height: 50,
//             decoration: BoxDecoration(
//               color: Colors.blue.shade400,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(12),
//                 bottomLeft: Radius.circular(12),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Material(
//               borderRadius: BorderRadius.circular(12),
//               color: Colors.white,
//               child: Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Row(
//                       children: [
//                         CircleAvatar(
//                           radius: 16,
//                           backgroundColor: Colors.blue.shade50,
//                           child: Text(
//                             name[0].toUpperCase(),
//                             style: TextStyle(
//                               color: Colors.blue.shade700,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 name,
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 8,
//                             vertical: 4,
//                           ),
//                           decoration: BoxDecoration(
//                             color: Colors.blue.shade50,
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Text(
//                             department,
//                             style: TextStyle(
//                               color: Colors.blue.shade700,
//                               fontSize: 11,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       email,
//                       style: const TextStyle(
//                         fontSize: 13,
//                         height: 1.3,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class DisplayCard extends StatelessWidget {
  final String name;
  final String email;
  final String department;

  const DisplayCard({
    Key? key,
    required this.name,
    required this.email,
    required this.department,
  }) : super(key: key);

  Color _getDepartmentColor(String department) {
    switch (department.toLowerCase()) {
      case 'computer engineering':
        return Colors.blue.shade400;
      case 'electrical engineering':
        return Colors.green.shade400;
      case 'chemical engineering':
        return Colors.red.shade400;
      case 'mechanical engineering':
        return Colors.orange.shade400;
      case 'information technology':
        return Colors.purple.shade400;
      case 'electronics and telecommunication engineering':
        return Colors.teal.shade400;
      default:
        return Colors.grey.shade400; // Default color for unknown departments
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 50,
            decoration: BoxDecoration(
              color: _getDepartmentColor(department),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.blue.shade50,
                          child: Text(
                            name[0].toUpperCase(),
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            department,
                            style: TextStyle(
                              color: Colors.blue.shade700,
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      email,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
