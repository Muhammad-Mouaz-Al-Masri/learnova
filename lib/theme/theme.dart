import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const Color primaryColor = Color(0xFF6218D9);
  static const Color secondaryColor = Color(0xFFFFFFFF);
  static const Color errorColor = Color(0xFFB00020);

  static final ThemeData lightTheme = ThemeData(
    primaryColor: primaryColor,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(backgroundColor: Colors.white),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 30, color: Colors.black),
      bodyLarge: TextStyle(fontSize: 18, color: Color(0xFF4A4455)),
      bodySmall: TextStyle(color: Color(0xFF4A4455), fontSize: 12),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: primaryColor,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      brightness: Brightness.dark,
    ),
  );
}
