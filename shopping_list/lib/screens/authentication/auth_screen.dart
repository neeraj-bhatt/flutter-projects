import 'package:flutter/material.dart';

import 'package:shopping_list/screens/authentication/log_in.dart';
import 'package:shopping_list/screens/authentication/sign_up.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase Authentication'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const Center(
                  child: Text("Sign Up"),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogInScreen(),
                    ));
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: const Center(
                  child: Text("Log In"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
