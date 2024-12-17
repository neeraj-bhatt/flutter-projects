import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Authentication'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("Sign Up"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("Log In"),
          )
        ],
      ),
    );
  }
}
