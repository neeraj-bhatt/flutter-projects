import 'package:flutter/material.dart';

import 'package:e_commerce/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

final theme = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.deepPurple,
    secondary: Colors.amber,
    surface: Colors.grey[50]!,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
  appBarTheme: AppBarTheme(elevation: 0),
  cardTheme: CardTheme(
    elevation: 3.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  ),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'e-commerce',
      debugShowCheckedModeBanner: false,
      theme: theme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
