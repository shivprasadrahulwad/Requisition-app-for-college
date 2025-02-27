import 'package:flutter/material.dart';
import 'package:mitaoe/screens/custom_text_field.dart';

class DirectorDetailsForm extends StatefulWidget {
  const DirectorDetailsForm({Key? key}) : super(key: key);

  @override
  _DirectorDetailsFormState createState() => _DirectorDetailsFormState();
}

class _DirectorDetailsFormState extends State<DirectorDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      print('Name: ${_nameController.text}');
      print('Email: ${_emailController.text}');
      print('Phone: ${_phoneController.text}');
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Details submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Director Details'),
        // backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                hintText: "Full Name",
                controller: _nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: "Email",
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                prefixIcon: const Icon(Icons.email),
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: "Phone Number",
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone number is required';
                  }
                  return null;
                },
                prefixIcon: const Icon(Icons.phone),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}