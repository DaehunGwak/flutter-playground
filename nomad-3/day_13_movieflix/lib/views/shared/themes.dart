import 'package:flutter/material.dart';

abstract class Themes {
  static final light = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: Colors.white,
      surface: Colors.white,
      primary: Colors.black,
      tertiary: Colors.white,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    ),
    useMaterial3: true,
  );
}
