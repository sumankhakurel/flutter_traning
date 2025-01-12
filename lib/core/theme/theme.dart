import 'package:demo2/core/apppallet.dart';
import 'package:demo2/core/theme/custom_theme/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Apppallet.appBar,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.white70,
    textTheme: AppTextTheme.lightTextTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: Colors.black87,
    fontFamily: GoogleFonts.handjet().fontFamily,
    scaffoldBackgroundColor: Colors.black54,
    textTheme: AppTextTheme.darkTextTheme,
  );
}
