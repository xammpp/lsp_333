import 'package:flutter/material.dart';

class AttendantPage extends StatefulWidget {
  @override
  _AttendantPageState createState() => _AttendantPageState();
}

class _AttendantPageState extends State<AttendantPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendant Form'),
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
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Handle form submission
                _submitForm();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    String name = _nameController.text;
    String location = _locationController.text;

    // You can handle the submitted data as needed, such as saving to a database or printing to the console
    print('Name: $name, Location: $location, Timestamp: ${DateTime.now()}');

    // You can also navigate away or show a success message to the user
  }

  @override
  void dispose() {
    // Clean up the controllers when the widget is disposed
    _nameController.dispose();
    _locationController.dispose();
    super.dispose();
  }
}
