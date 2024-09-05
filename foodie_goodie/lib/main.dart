import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:foodie_goodie/screens/category_screen.dart';


final theme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,  //for dark mode
    seedColor: const Color.fromARGB(255, 131, 57, 0),
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: theme,
        home: const CategoryScreen()
    );
  }
}