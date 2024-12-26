import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shopping_list/screens/grocery_list.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LogInScreenState();
  }
}

class _LogInScreenState extends State<LogInScreen> {
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _logIn() async {
    if (!_formKey.currentState!.validate())
      return; // if input field entry are not validate, simply return;

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Log In Successful")),
        );
      }
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const GroceryListScreen()));
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error: ${e.toString()}")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Back"),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.only(
              left: 22.0,
              right: 22.0,
              bottom: MediaQuery.of(context).size.width * 0.3),
          padding: const EdgeInsets.all(22.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.white, width: 2)),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: "Email"),
                  maxLength: 254,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                        .hasMatch(value)) {
                      return "Enter a valid Email";
                    } else if (value.length > 254) {
                      return "Email is too long (max 254 Characters)";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(labelText: "Password"),
                  obscureText: true,
                  maxLength: 64,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    } else if (value.length < 8) {
                      return "Password is too short (at least 8 characters";
                    } else if (value.length > 64) {
                      return "Password is too long (max 64 characters";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 18.0,
                ),
                ElevatedButton(onPressed: _logIn, child: const Text("Log In")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
