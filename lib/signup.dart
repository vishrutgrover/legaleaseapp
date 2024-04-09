import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawy/whatwedo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_apple_sign_in/flutter_apple_sign_in.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String email = '';
  String password = '';
  GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> _handleSignIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        // Signed in successfully, now you can access user details
        print('User signed in: ${googleSignInAccount.displayName}');
      } else {
        // User canceled the sign-in process
        print('User canceled sign-in');
      }
    } catch (error) {
      // Handle sign-in errors
      print('Sign-in error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EAFF),
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'assets/Icon_light_mode.png',
              height: 100,
              color: Color.fromRGBO(255, 255, 255, 0.4),
              colorBlendMode: BlendMode.srcOver,
            ),
            SizedBox(height: 20.0),
            Text(
              'Sign In',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Email Address *',
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  password = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Password *',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'By registering for an account, you are consenting to our Terms of Service and confirming that you have reviewed and accepted the Global Privacy Statement.',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
            SizedBox(height: 50.0),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WhatWeDoPage()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/email-icon.svg', // Replace with your SVG asset path
                          width: 100,
                          height: 40,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Continue with Email',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ).copyWith(
                      side: MaterialStateProperty.resolveWith<BorderSide>(
                        (Set<MaterialState> states) {
                          return BorderSide(
                            color: Colors.black, // Border color
                            width: 2, // Border width
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: _handleSignIn,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/google-icon.svg', // Replace with your SVG asset path
                          width: 100,
                          height: 40,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Continue with Google',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ).copyWith(
                      side: MaterialStateProperty.resolveWith<BorderSide>(
                        (Set<MaterialState> states) {
                          return BorderSide(
                            color: Colors.black, // Border color
                            width: 2, // Border width
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    // onPressed: _handleSignInWithApple,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/apple-icon.svg', // Replace with your SVG asset path
                          width: 100,
                          height: 40,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Continue with Apple',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                    ).copyWith(
                      side: MaterialStateProperty.resolveWith<BorderSide>(
                        (Set<MaterialState> states) {
                          return BorderSide(
                            color: Colors.black, // Border color
                            width: 2, // Border width
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
