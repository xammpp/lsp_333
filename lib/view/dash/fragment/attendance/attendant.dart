import 'package:flutter/material.dart';
import 'package:flutter_app/db/helper/attendant/attend.dart';
import 'package:flutter_app/model/attend.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import LatLng

class AttendantPage extends StatefulWidget {
  @override
  _AttendantPageState createState() => _AttendantPageState();
}

class _AttendantPageState extends State<AttendantPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  List<Attendant> _attendanceHistory = [];

  @override
  void initState() {
    super.initState();
    _loadAttendanceHistory();
  }

  Future<void> _loadAttendanceHistory() async {
    AttendantHelper helper = AttendantHelper();
    await AttendantHelper.initialize();
    List<Attendant> attendants = await helper.getAttendants();
    setState(() {
      _attendanceHistory = attendants;
    });
  }

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
                _submitForm();
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Attendance History',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            Expanded(
              child: _buildAttendanceHistoryList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttendanceHistoryList() {
    return ListView.builder(
      itemCount: _attendanceHistory.length,
      itemBuilder: (context, index) {
        Attendant attendant = _attendanceHistory[index];
        return ListTile(
          title: Text(attendant.username),
          subtitle: Text(attendant.location),
          trailing: Text(
            '${attendant.timestamp.hour}:${attendant.timestamp.minute}, ${attendant.timestamp.day}/${attendant.timestamp.month}/${attendant.timestamp.year}',
          ),
        );
      },
    );
  }

  Future<void> _submitForm() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String name = _nameController.text;
    String location =
        "${position.latitude},${position.longitude}"; // Convert LatLng to String

    AttendantHelper helper = AttendantHelper();
    await AttendantHelper.initialize();
    Attendant newAttendant = Attendant(
      username: name,
      location: location, // Use LatLng instead of GeoPoint
      timestamp: DateTime.now(),
    );
    await helper.insertAttendant(newAttendant);

    _nameController.clear();
    _locationController.clear();

    _loadAttendanceHistory();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _locationController.dispose();
    super.dispose();
  }
}
