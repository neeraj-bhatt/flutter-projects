import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:e_commerce/features/tab/tab_screen.dart';
import 'auth_view.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;
    return StreamBuilder(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        else if(snapshot.hasData){
          return const TabScreen();
        }
        else{
          return const AuthScreen();
        }
      },
    );
  }
}
