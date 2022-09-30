// ignore_for_file: non_constant_identifier_names, camel_case_types


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:log_app/screens/otpScreen.dart';
import 'package:log_app/screens/signin.dart';
import 'package:log_app/screens/signup.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    String phoneNumber = '';
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {'/loginscreen': (context) => loginPage(),
      '/signup':(context) => signuppage(),
      '/otp':(context) => otpScreen(phoneNumber)},
      home: const loginPage(),
    );
  }
}

