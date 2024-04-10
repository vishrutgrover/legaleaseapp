import 'package:flutter/material.dart';
import 'package:lawy/signup.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void handleButtonPressed() {
    // Add functionality for the button press here
    print("Button Pressed!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EAFF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/Icon_light_mode.png', // Provide your logo image path here
                  height: 100, // Adjust the height as needed
                ),
              ),
              SizedBox(height: 20),
              Text(
                'LegalEase',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Days One',
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Empowerment Redefined!',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: 'Days One',
                ),
              ),
              SizedBox(height: 350),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF5661F6),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  'Get Started!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Days One',
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
