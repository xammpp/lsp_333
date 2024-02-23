import 'package:flutter/material.dart';
import 'package:flutter_app/db/db/db.dart'; // Import your database helper
import 'package:flutter_app/view/splash/splash.dart'; // Import your profile page

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initialize(); // Initialize the database factory
  await DatabaseHelper.instance.database; // Initialize the database
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(), // Set your root widget here
    );
  }
}
