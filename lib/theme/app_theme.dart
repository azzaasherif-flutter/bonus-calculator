import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF0F5132);
  static const Color primaryLight = Color(0xFF1A7A4A);
  static const Color surface = Color(0xFFF7FAF8);
  static const Color cardBg = Colors.white;
  static const Color inputBg = Color(0xFFF4F9F6);
  static const Color border = Color(0xFFC5DECE);
  static const Color textMuted = Color(0xFF7AB898);
  static const Color textSecondary = Color(0xFF4A7A60);

  static ThemeData get theme => ThemeData(
    fontFamily: 'Cairo',
    colorScheme: ColorScheme.fromSeed(seedColor: primary),
    scaffoldBackgroundColor: surface,
    useMaterial3: true,
  );
}
