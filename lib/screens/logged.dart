import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loggedIn extends StatelessWidget {
  const loggedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              FirebaseAuth.instance.signOut();
            })
      ]),
      body: Center(
        child: Text('Welcome To Log App'),
      ),
    );
  }
}
