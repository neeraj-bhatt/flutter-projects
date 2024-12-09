import 'package:beats_and_beast/main.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color deepIndigo1 = Color(0xFF6F74A1); // Deep Indigo
  static const Color deepIndigo = Color(0xFF4A4E69); // Deep Indigo
  static const Color softCoral = Color(0xFFF9A8B3); // Soft Coral
  static const Color mutedMint = Color(0xFFB0E0D3); // Muted Mint
  static const Color charcoalGray = Color(0xFF2E2E2E); // Charcoal Gray
  static const Color offWhite = Color(0xFFFAF9F6); // Off-White
  static const Color slateGray = Color(0xFF5A5A5A); // Slate Gray


  static final ThemeData theme = ThemeData(
    primaryColor: deepIndigo,
    scaffoldBackgroundColor: deepIndigo1,
    cardColor: mutedMint,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: offWhite), // Primary Text
      bodyMedium: TextStyle(color: slateGray), // Secondary Text
      bodySmall: TextStyle(color: charcoalGray), // Small Text
      headlineLarge: TextStyle(color: offWhite), // Primary Text
      headlineMedium: TextStyle(color: slateGray), // Secondary Text
      headlineSmall: TextStyle(color: charcoalGray),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: softCoral,
        foregroundColor: offWhite,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: deepIndigo,
      iconTheme: IconThemeData(color: offWhite),
      titleTextStyle: TextStyle(color: offWhite),
    ),
    iconTheme: const IconThemeData(color: offWhite),
    colorScheme: const ColorScheme(
      primary: deepIndigo,
      primaryContainer: mutedMint,
      secondary: softCoral,
      secondaryContainer: slateGray,
      surface: mutedMint,
      error: Colors.red,
      onPrimary: offWhite,
      onSecondary: offWhite,
      onSurface: charcoalGray,
      onError: Colors.white,
      brightness:
          Brightness.dark, // Adjust based on overall theme (light/dark mode)
    ),
  );
}
