import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xFF6750A4),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white, // Set card color to red for light theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF6750A4),
    ),
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF6750A4),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black54),
      headlineMedium: TextStyle(color: Colors.black, fontSize: 30),
    ),
    iconTheme: const IconThemeData(color: Colors.black54),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF6750A4),
    scaffoldBackgroundColor: const Color(0xFF171821),
    cardColor: Color(0xFF171821), // Set card color for dark theme
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF6750A4),
    ),
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFF6750A4),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: const Color(0xFF1C1C1E),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white70),
      headlineMedium: TextStyle(color: Colors.white, fontSize: 30),
    ),
    iconTheme: const IconThemeData(color: Colors.white70),
  );
}
