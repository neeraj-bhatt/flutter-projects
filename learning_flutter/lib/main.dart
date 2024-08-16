import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hello World",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          Text(
            "Neeraj Here",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          FlutterLogo(),
        ],
      ),
    ),
  ));
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key});

  @override
  Widget build(context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        child: const Text(
          'Container',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
