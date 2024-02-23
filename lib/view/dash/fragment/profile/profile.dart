import 'package:flutter/material.dart';
import 'package:flutter_app/db/helper/auth/user_profilehelper.dart';
import 'package:flutter_app/session/sessionmanager.dart'; // Import your session manager

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
    super.initState();
    _populateFields();
  }

  void _populateFields() {
    // Retrieve user data from session manager or any other source
    // For demonstration, let's assume session manager has a method getCurrentUser() that returns a user object
    var currentUser = SessionManager.getCurrentUser();
    if (currentUser != null) {
      _nameController.text = currentUser.name;
      _emailController.text = currentUser.email;
      _phoneNumberController.text = currentUser.phoneNumber;
    }
  }

  void _submitForm() async {
    String name = _nameController.text;
    String email = _emailController.text;
    int phoneNumber = int.tryParse(_phoneNumberController.text) ??
        0; // Convert string to integer

    // Update the user's profile using UserProfileHelper
    await UserProfileHelper().updateUserProfile(name, email, phoneNumber);

    // Show a snackbar to indicate success
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Profile updated successfully'),
        duration: Duration(seconds: 2),
      ),
    );
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
