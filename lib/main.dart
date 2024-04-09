import 'package:flutter/material.dart';
import 'package:lawy/login.dart';
import 'package:lawy/signup.dart';
import 'package:lawy/whatwedo.dart';
// import 'package:lawy/signup.dart';
// import 'package:lawy/register.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
    routes: {
      'SignIn': (context) => SignInPage(),
      'whatwedo': (context) => WhatWeDoPage(),
      // 'progress': (progress) => MyProgress(),
    },
  ));
}
