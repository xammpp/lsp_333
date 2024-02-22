import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/view/auth/login.dart'; // Import your login page file

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a delay for the splash screen
    Timer(Duration(seconds: 3), () {
      // Navigate to the login page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => LoginApp(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.black, // Set background color to black for dark mode
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // You can add your logo or any other content for the splash screen here
            CircularProgressIndicator(), // Example of a loading indicator
            SizedBox(height: 20),
            Text(
              'LSP',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
