import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lawy/whatwedo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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

  Future<void> _signInWithFacebook() async {
    try {
      final LoginResult result = await FacebookAuth.instance.login();

      if (result.status == LoginStatus.success) {
        // User is logged in, you can access result.accessToken
        final String? accessToken = result.accessToken?.token;

        if (accessToken != null) {
          // Use the access token as needed, e.g., send it to your backend server
          // Do not print access token in production, this is just for demonstration
          print('Access token: $accessToken');

          // Navigate to next screen or perform other actions after signing in
        } else {
          // Handle null access token
          print('Failed to obtain access token from Facebook');
        }
      } else {
        // Handle error or user cancelled the login
        print('Failed to sign in with Facebook');
      }
    } catch (e) {
      // Handle exception
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9EAFF),
      // appBar: AppBar(
      //   title: Text('Sign In'),
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 60.0),
            ClipOval(
              child: Image.asset(
                'assets/Icon_light_mode.png',
                height: 100,
                color: Color.fromRGBO(255, 255, 255, 0.2),
                colorBlendMode: BlendMode.srcOver,
                fit: BoxFit.fitHeight,
              ),
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
              obscureText: true,
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
                          'assets/email.svg', // Replace with your SVG asset path
                          width: 48,
                          height: 48,
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
                          'assets/google.svg', // Replace with your SVG asset path
                          width: 48,
                          height: 48,
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
                    onPressed: _signInWithFacebook,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/facebook.svg', // Replace with your SVG asset path
                          width: 48,
                          height: 48,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Continue with Facebook',
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
