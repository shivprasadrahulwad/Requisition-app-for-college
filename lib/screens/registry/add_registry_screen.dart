import 'package:flutter/material.dart';
import 'package:mitaoe/screens/registry/registry_list_screen.dart';

class AddRegistryScreen extends StatefulWidget {
  final Function(Registry) onDeanAdded;

  const AddRegistryScreen({Key? key, required this.onDeanAdded}) : super(key: key);

  @override
  State<AddRegistryScreen> createState() => _AddRegistryScreenState();
}

class _AddRegistryScreenState extends State<AddRegistryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _departmentController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Dean'),
        backgroundColor: const Color(0xFF6C63FF),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(
                controller: _nameController,
                label: 'Name',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _departmentController,
                label: 'Department',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter department';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _emailController,
                label: 'Email ID',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter email';
                  }
                  if (!value!.contains('@')) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _phoneController,
                label: 'Phone Number',
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6C63FF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Add Dean',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        filled: true,
        fillColor: Colors.grey[100],
      ),
      validator: validator,
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      final dean = Registry(
        name: _nameController.text,
        department: _departmentController.text,
        emailId: _emailController.text,
        phoneNumber: _phoneController.text,
      );
      widget.onDeanAdded(dean);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _departmentController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}