import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.teal,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
    centerTitle: true,
  ),
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.teal,
    surface: Colors.teal,
    onSurface: Colors.white,
  ),
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      inherit: true,
      fontSize: 42.0,
      fontWeight: FontWeight.w800,
    ),
  ),
  useMaterial3: true,
);
