import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfGeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Confirm name and email again',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PdfGenerationScreen(),
    );
  }
}

class PdfGenerationScreen extends StatefulWidget {
  @override
  _PdfGenerationScreenState createState() => _PdfGenerationScreenState();
}

class _PdfGenerationScreenState extends State<PdfGenerationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  Future<void> _generatePDF() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text(
                  'This would be the terms and condition paper',
                  style: pw.TextStyle(
                      fontSize: 20, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 20),
                pw.Text(
                  'Name: ${nameController.text}',
                  style: pw.TextStyle(fontSize: 16),
                ),
                pw.Text(
                  'Email: ${emailController.text}',
                  style: pw.TextStyle(fontSize: 16),
                ),
              ],
            ),
          );
        },
      ),
    );

    final output = await getTemporaryDirectory();
    final outputFile = File('${output.path}/user_info.pdf');
    await outputFile.writeAsBytes(await pdf.save());

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Name and Email'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      color: Colors.blue, // Set the label text color
                      fontSize: 16, // Set the label text size
                      fontWeight: FontWeight.bold, // Set the label text weight
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .blue), // Set the border color of the TextFormField when enabled
                      borderRadius: BorderRadius.circular(
                          10), // Set the border radius of the TextFormField when enabled
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .blue), // Set the border color of the TextFormField when focused
                      borderRadius: BorderRadius.circular(
                          10), // Set the border radius of the TextFormField when focused
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .red), // Set the border color of the TextFormField when there's an error
                      borderRadius: BorderRadius.circular(
                          10), // Set the border radius of the TextFormField when there's an error
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .red), // Set the border color of the TextFormField when there's an error and focused
                      borderRadius: BorderRadius.circular(
                          10), // Set the border radius of the TextFormField when there's an error and focused
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red, // Set the error text color
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.blue, // Set the label text color
                      fontSize: 16, // Set the label text size
                      fontWeight: FontWeight.bold, // Set the label text weight
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .blue), // Set the border color of the TextFormField when enabled
                      borderRadius: BorderRadius.circular(
                          10), // Set the border radius of the TextFormField when enabled
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .blue), // Set the border color of the TextFormField when focused
                      borderRadius: BorderRadius.circular(
                          10), // Set the border radius of the TextFormField when focused
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .red), // Set the border color of the TextFormField when there's an error
                      borderRadius: BorderRadius.circular(
                          10), // Set the border radius of the TextFormField when there's an error
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors
                              .red), // Set the border color of the TextFormField when there's an error and focused
                      borderRadius: BorderRadius.circular(
                          10), // Set the border radius of the TextFormField when there's an error and focused
                    ),
                    errorStyle: TextStyle(
                      color: Colors.red, // Set the error text color
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _generatePDF,
                  child: Text(
                    'Confirm name & email',
                    style: TextStyle(
                      fontSize: 16, // Set the button text size
                      fontWeight: FontWeight.bold, // Set the button text weight
                    ),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.blue), // Set the background color of the button
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Set the text color of the button
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal:
                              24), // Set the padding around the button text
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // Set the border radius of the button
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
