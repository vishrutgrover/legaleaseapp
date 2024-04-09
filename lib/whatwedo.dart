import 'package:flutter/material.dart';

class WhatWeDoPage extends StatefulWidget {
  @override
  _WhatWeDoPageState createState() => _WhatWeDoPageState();
}

class _WhatWeDoPageState extends State<WhatWeDoPage> {
  void handleButtonPressed() {
    // Add functionality for the button press here
    print("Continue button pressed!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EAFF),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to ",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontFamily: 'Days One',
                  ),
                ),
                Text(
                  "LegalEase",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF5661F6),
                    fontFamily: 'Days One',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Your one-stop solution for drafting templates",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontFamily: 'Days One',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Draft ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 255, 183, 0),
                    fontFamily: 'Days One',
                  ),
                ),
                Text(
                  "as many legal documents as you desire, with just one prompt",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: 'Days One',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Save ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 255, 183, 0),
                    fontFamily: 'Days One',
                  ),
                ),
                Text(
                  "your drafted docs and access them at any time",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: 'Days One',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "And a lot ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: 'Days One',
                  ),
                ),
                Text(
                  "more",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 255, 183, 0),
                    fontFamily: 'Days One',
                  ),
                ),
                Text(
                  "...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontFamily: 'Days One',
                  ),
                ),
              ],
            ),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: handleButtonPressed,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF5661F6),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'Continue',
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
    );
  }
}
