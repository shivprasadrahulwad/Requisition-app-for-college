import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class CanteenRequisitionPDF {
  static Future<void> generateAndPrintPDF() async {
    final pdf = pw.Document();

    // Load the logo from assets
    final logoBytes = await rootBundle.load('assets/images/mit_logo.jpeg');
    final logoImage = pw.MemoryImage(logoBytes.buffer.asUint8List());

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Expanded(
            child: pw.Padding(
              padding: const pw.EdgeInsets.all(20),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  // Logo at the top center
                  if (logoImage != null)
                    pw.Center(
                      child: pw.Image(logoImage, width: 150, height: 100),
                    ),
                  pw.SizedBox(height: 10),

                  // Contact Information
                  pw.Center(
                    child: pw.Text(
                      '(020) 30253575, 30253500, Fax:(020) 30253799',
                      style: const pw.TextStyle(fontSize: 10),
                    ),
                  ),
                  pw.SizedBox(height: 20),

                  // Title and Date Row
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Expanded(
                        child: pw.Center(
                          child: pw.Text(
                            'Canteen Requisition Form',
                            style: pw.TextStyle(
                              fontSize: 18,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      pw.RichText(
                        text: pw.TextSpan(
                          children: [
                            pw.TextSpan(
                              text: 'Date:- ', // The bold part
                              style: pw.TextStyle(
                                fontSize: 12,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            const pw.TextSpan(
                              text: '20/12/2025',
                              style: pw.TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  pw.SizedBox(height: 20),

                  // Applicant Details
                  pw.RichText(
                    text: pw.TextSpan(
                      children: [
                        const pw.TextSpan(
                          text: 'I ',
                          style: pw.TextStyle(fontSize: 12),
                        ),
                        pw.TextSpan(
                          text: 'sai',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                            decoration: pw.TextDecoration.underline,
                          ),
                        ),
                        const pw.TextSpan(
                          text: ', Designation ',
                          style: pw.TextStyle(fontSize: 12),
                        ),
                        pw.TextSpan(
                          text: 'Student', // Bold and underlined "Student"
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                            decoration: pw.TextDecoration.underline,
                          ),
                        ),
                        const pw.TextSpan(
                          text: ', Department ',
                          style: pw.TextStyle(fontSize: 12),
                        ),
                        pw.TextSpan(
                          text: 'SCE', // Bold and underlined "SCE"
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                            decoration: pw.TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 10),

                  // Request Text
                  pw.Text(
                    'Request for providing of the following material through the college canteen.',
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  pw.SizedBox(height: 10),

                  // Purpose
                  pw.RichText(
                    text: pw.TextSpan(
                      children: [
                        pw.TextSpan(
                          text: 'Purpose:', // The bold part
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        const pw.TextSpan(
                          text:
                              ' Arrangement of breakfast for external visitors.',
                          style: pw.TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 20),

                  // Table
                  pw.Table(
                    border: pw.TableBorder.all(),
                    columnWidths: {
                      0: const pw.FlexColumnWidth(1),
                      1: const pw.FlexColumnWidth(3),
                      2: const pw.FlexColumnWidth(2),
                      3: const pw.FlexColumnWidth(2),
                      4: const pw.FlexColumnWidth(2),
                    },
                    children: [
                      // Table Header
                      pw.TableRow(
                        decoration: const pw.BoxDecoration(
                          color: PdfColors.grey300,
                        ),
                        children: [
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Sr. No.',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Type of Material',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Quantity Required',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Date Required',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                          pw.Padding(
                            padding: const pw.EdgeInsets.all(8),
                            child: pw.Text('Remarks',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                          ),
                        ],
                      ),
                      // Table Data
                      _buildTableRow('1', 'Tea', '10', '20/01/2025', '-'),
                      _buildTableRow('2', 'Coffee', '5', '20/01/2025', '-'),
                      _buildTableRow(
                          '3', 'Breakfast', '15', '20/01/2025', 'Veg'),
                      _buildTableRow('4', 'Working Lunch', '0', '-', '-'),
                      _buildTableRow('5', 'Dinner', '0', '-', '-'),
                    ],
                  ),
                  pw.SizedBox(height: 50),

                  // Signatures
                  pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Container(
                            width: 100,
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(width: 1),
                              ),
                            ),
                            height: 40,
                          ),
                          pw.Text(
                            'Applicant',
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Container(
                            width: 100,
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(width: 1),
                              ),
                            ),
                            height: 40,
                          ),
                          pw.Text(
                            'HOD',
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.center,
                        children: [
                          pw.Container(
                            width: 100,
                            decoration: const pw.BoxDecoration(
                              border: pw.Border(
                                bottom: pw.BorderSide(width: 1),
                              ),
                            ),
                            height: 40,
                          ),
                          pw.Text(
                            'Registrar',
                            style: pw.TextStyle(
                              fontSize: 12,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );

    // Print the document
    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  static pw.TableRow _buildTableRow(String srNo, String material,
      String quantity, String date, String remarks) {
    return pw.TableRow(
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(srNo),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(material),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(quantity),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(date),
        ),
        pw.Padding(
          padding: const pw.EdgeInsets.all(8),
          child: pw.Text(remarks),
        ),
      ],
    );
  }
}
