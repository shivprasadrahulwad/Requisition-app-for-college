import 'package:flutter/material.dart';
import 'package:mitaoe/screens/custom_drop_down.dart';
import 'package:mitaoe/screens/custom_text_field.dart';

class DeanDetailsForm extends StatefulWidget {
  const DeanDetailsForm({Key? key}) : super(key: key);

  @override
  _DeanDetailsFormState createState() => _DeanDetailsFormState();
}

class _DeanDetailsFormState extends State<DeanDetailsForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  String? selectedDepartment;

  // Sample departments list - replace with your actual departments
  final List<String> departments = [
    'Computer Science',
    'Electrical Engineering',
    'Mechanical Engineering',
    'Civil Engineering',
    'Information Technology'
  ];

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
      print('Department: $selectedDepartment');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Details submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dean Details'),
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
              const SizedBox(height: 16),
              CustomDropdownField(
                hintText: "Department",
                value: selectedDepartment,
                items: departments,
                placeholderText: "Select Department",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a department';
                  }
                  return null;
                },
                onChanged: (String? newValue) {
                  setState(() {
                    selectedDepartment = newValue;
                  });
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



