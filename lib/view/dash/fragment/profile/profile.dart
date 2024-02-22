import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
                _submitForm();
              },
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // Simulate fetching user data, replace with actual user data retrieval logic
    _nameController.text = 'John Doe';
    _emailController.text = 'john.doe@example.com';
    _phoneNumberController.text = '+1234567890';
    super.initState();
  }

  void _submitForm() {
    String name = _nameController.text;
    String email = _emailController.text;
    String phoneNumber = _phoneNumberController.text;

    // You can handle the submitted data as needed, such as updating the user's profile
    // For demonstration, let's just print the updated profile information
    print('Updated Profile:');
    print('Name: $name, Email: $email, Phone Number: $phoneNumber');
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }
}
