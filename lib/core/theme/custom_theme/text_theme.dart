import 'package:flutter/material.dart';

class AppTextTheme {
  static TextTheme lightTextTheme = const TextTheme(
    displayLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 124, color: Colors.black87),
    titleMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black54),
    titleSmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black38),
    labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
  );

  static TextTheme darkTextTheme = const TextTheme(
    displayLarge: TextStyle(
        fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
    displayMedium: TextStyle(
        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.white70),
    titleMedium: TextStyle(
        fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white54),
    titleSmall: TextStyle(
        fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white38),
    labelLarge: TextStyle(
        fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
  );
}
