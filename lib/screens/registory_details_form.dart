// import 'package:flutter/material.dart';
// import 'package:mitreq/widgets/custom_drop_down.dart';
// import 'package:mitreq/widgets/custom_text_field.dart';

// // class RegistoryDetailsForm extends StatefulWidget {
// //   const RegistoryDetailsForm({Key? key}) : super(key: key);

// //   @override
// //   _RegistoryDetailsFormState createState() => _RegistoryDetailsFormState();
// // }

// // class _RegistoryDetailsFormState extends State<RegistoryDetailsForm> {
// //   final _formKey = GlobalKey<FormState>();
// //   final _nameController = TextEditingController();
// //   final _emailController = TextEditingController();
// //   final _phoneController = TextEditingController();
// //   String? selectedDepartment;

// //   // Sample departments list - replace with your actual departments
// //   final List<String> departments = [
// //     'Computer Science',
// //     'Electrical Engineering',
// //     'Mechanical Engineering',
// //     'Civil Engineering',
// //     'Information Technology'
// //   ];

// //   @override
// //   void dispose() {
// //     _nameController.dispose();
// //     _emailController.dispose();
// //     _phoneController.dispose();
// //     super.dispose();
// //   }

// //   void _submitForm() {
// //     if (_formKey.currentState!.validate()) {
// //       // Handle form submission
// //       print('Name: ${_nameController.text}');
// //       print('Email: ${_emailController.text}');
// //       print('Phone: ${_phoneController.text}');
// //       print('Department: $selectedDepartment');

// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Details submitted successfully!')),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Registory Details'),
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Form(
// //           key: _formKey,
// //           child: Column(
// //             children: [
// //               CustomTextField(
// //                 hintText: "Full Name",
// //                 controller: _nameController,
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Name is required';
// //                   }
// //                   return null;
// //                 },
// //                 prefixIcon: const Icon(Icons.person),
// //               ),
// //               const SizedBox(height: 16),
// //               CustomTextField(
// //                 hintText: "Email",
// //                 controller: _emailController,
// //                 keyboardType: TextInputType.emailAddress,
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Email is required';
// //                   }
// //                   if (!value.contains('@')) {
// //                     return 'Please enter a valid email';
// //                   }
// //                   return null;
// //                 },
// //                 prefixIcon: const Icon(Icons.email),
// //               ),
// //               const SizedBox(height: 16),
// //               CustomTextField(
// //                 hintText: "Phone Number",
// //                 controller: _phoneController,
// //                 keyboardType: TextInputType.phone,
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Phone number is required';
// //                   }
// //                   return null;
// //                 },
// //                 prefixIcon: const Icon(Icons.phone),
// //               ),
// //               const SizedBox(height: 16),
// //               CustomDropdownField(
// //                 hintText: "Department",
// //                 value: selectedDepartment,
// //                 items: departments,
// //                 placeholderText: "Select Department",
// //                 validator: (value) {
// //                   if (value == null || value.isEmpty) {
// //                     return 'Please select a department';
// //                   }
// //                   return null;
// //                 },
// //                 onChanged: (String? newValue) {
// //                   setState(() {
// //                     selectedDepartment = newValue;
// //                   });
// //                 },
// //               ),
// //               const SizedBox(height: 24),
// //               ElevatedButton(
// //                 onPressed: _submitForm,
// //                 style: ElevatedButton.styleFrom(
// //                   minimumSize: const Size(double.infinity, 50),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(15),
// //                   ),
// //                 ),
// //                 child: const Text('Submit'),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }




// import 'dart:io';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:path_provider/path_provider.dart';
// import 'dart:typed_data';
// import 'package:flutter/services.dart' show rootBundle;

// class CanteenRequisitionPDF {
//   static Future<File> generatePDF() async {
//     final pdf = pw.Document();

//     // Load the logo image
//     final ByteData imageData = await rootBundle.load('assets/images/mit_logo.jpeg');
//     final Uint8List imageBytes = imageData.buffer.asUint8List();
//     final logoImage = pw.MemoryImage(imageBytes);

//     // Create the PDF content
//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (pw.Context context) {
//           return pw.Padding(
//             padding: const pw.EdgeInsets.all(20),
//             child: pw.Column(
//               crossAxisAlignment: pw.CrossAxisAlignment.start,
//               children: [
//                 // Logo at the top center
//                 pw.Expanded(
//                   child: pw.Padding(
//                     padding: const pw.EdgeInsets.all(20),
//                     child: pw.Column(
//                       crossAxisAlignment: pw.CrossAxisAlignment.start,
//                       children: [
//                         // Logo at the top center
//                         if (logoImage != null)
//                           pw.Center(
//                             child: pw.Image(logoImage, width: 150, height: 100),
//                           ),
//                         pw.SizedBox(height: 10),

//                         // Contact Information
//                 pw.Center(
//                   child: pw.Row(
//                     mainAxisAlignment: pw.MainAxisAlignment.center,
//                     children: [
//                       pw.Icon(pw.IconData(0xe4a2)), // Phone icon
//                       pw.SizedBox(width: 5),
//                       pw.Text(
//                         '(020) 30253575, 30253500, Fax:(020) 30253799',
//                         style: pw.TextStyle(fontSize: 10),
//                       ),
//                     ],
//                   ),
//                 ),
//                 pw.SizedBox(height: 20),

//                 // Title and Date Row
//                 pw.Row(
//                   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                   crossAxisAlignment: pw.CrossAxisAlignment.start,
//                   children: [
//                     pw.Expanded(
//                       child: pw.Center(
//                         child: pw.Text(
//                           'Canteen Requisition Form',
//                           style: pw.TextStyle(
//                             fontSize: 18,
//                             fontWeight: pw.FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//                     pw.Text(
//                       'Date:- 20/12/2025',
//                       style: pw.TextStyle(fontSize: 12),
//                     ),
//                   ],
//                 ),
//                 pw.SizedBox(height: 20),

//                 // Applicant Details
//                 pw.Text(
//                   'I Sai, Designation Student, Department SCE',
//                   style: pw.TextStyle(fontSize: 12,),
//                 ),
//                 pw.SizedBox(height: 10),

//                 // Request Text
//                 pw.Text(
//                   'Request for providing of the following material through the college canteen.',
//                   style: pw.TextStyle(fontSize: 12),
//                 ),
//                 pw.SizedBox(height: 10),

//                 // Purpose
//                 pw.Text(
//                   'Purpose: Arrangement of breakfast for external visitors.',
//                   style: pw.TextStyle(fontSize: 12),
//                 ),
//                 pw.SizedBox(height: 20),

//                 // Table

//                         // Table
//                         pw.Table(
//                           border: pw.TableBorder.all(),
//                           columnWidths: {
//                             0: const pw.FlexColumnWidth(1),
//                             1: const pw.FlexColumnWidth(3),
//                             2: const pw.FlexColumnWidth(2),
//                             3: const pw.FlexColumnWidth(2),
//                             4: const pw.FlexColumnWidth(2),
//                           },
//                           children: [
//                             pw.TableRow(
//                       decoration: pw.BoxDecoration(
//                         color: PdfColors.grey300,
//                       ),
//                       children: [
//                         pw.Padding(
//                           padding: const pw.EdgeInsets.all(8),
//                           child: pw.Text('Sr. No.',
//                               style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                         ),
//                         pw.Padding(
//                           padding: const pw.EdgeInsets.all(8),
//                           child: pw.Text('Type of Material',
//                               style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                         ),
//                         pw.Padding(
//                           padding: const pw.EdgeInsets.all(8),
//                           child: pw.Text('Quantity Required',
//                               style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                         ),
//                         pw.Padding(
//                           padding: const pw.EdgeInsets.all(8),
//                           child: pw.Text('Date Required',
//                               style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                         ),
//                         pw.Padding(
//                           padding: const pw.EdgeInsets.all(8),
//                           child: pw.Text('Remarks',
//                               style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
//                         ),
//                       ],
//                     ),
//                     // Table Data
//                     _buildTableRow('1', 'Tea', '10', '20/01/2025', '-'),
//                     _buildTableRow('2', 'Coffee', '5', '20/01/2025', '-'),
//                     _buildTableRow('3', 'Breakfast', '15', '20/01/2025', 'Veg'),
//                     _buildTableRow('4', 'Working Lunch', '0', '-', '-'),
//                     _buildTableRow('5', 'Dinner', '0', '-', '-'),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),

//                 pw.SizedBox(height: 50),

//                 // Signatures
//                 pw.Container(
//                   padding: const pw.EdgeInsets.all(20),
//                   child: pw.Row(
//                     mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                     children: [
//                       _buildSignatureColumn('Applicant'),
//                       _buildSignatureColumn('HOD'),
//                       _buildSignatureColumn('Registrar'),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );

//     // Save the PDF
//     final bytes = await pdf.save();

//     // Get the app's local storage directory
//     final dir = await getApplicationDocumentsDirectory();
//     final file = File('${dir.path}/canteen_requisition.pdf');

//     // Write the PDF to the file
//     await file.writeAsBytes(bytes);

//     return file;
//   }

//   static pw.Widget _buildSignatureColumn(String title) {
//     return pw.Column(
//       crossAxisAlignment: pw.CrossAxisAlignment.center,
//       mainAxisSize: pw.MainAxisSize.min,
//       children: [
//         pw.Container(
//           width: 100,
//           height: 40,
//           decoration: pw.BoxDecoration(
//             border: pw.Border(
//               bottom: pw.BorderSide(width: 1),
//             ),
//           ),
//         ),
//         pw.SizedBox(height: 5),
//         pw.Text(title),
//       ],
//     );
//   }


//   static pw.TableRow _buildTableRow(
//       String srNo, String material, String quantity, String date, String remarks) {
//     return pw.TableRow(
//       children: [
//         pw.Padding(
//           padding: const pw.EdgeInsets.all(8),
//           child: pw.Text(srNo),
//         ),
//         pw.Padding(
//           padding: const pw.EdgeInsets.all(8),
//           child: pw.Text(material),
//         ),
//         pw.Padding(
//           padding: const pw.EdgeInsets.all(8),
//           child: pw.Text(quantity),
//         ),
//         pw.Padding(
//           padding: const pw.EdgeInsets.all(8),
//           child: pw.Text(date),
//         ),
//         pw.Padding(
//           padding: const pw.EdgeInsets.all(8),
//           child: pw.Text(remarks),
//         ),
//       ],
//     );
//   }
// }