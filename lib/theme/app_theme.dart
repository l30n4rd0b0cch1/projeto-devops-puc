import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFFE53935); // Dark red / crimson base
  static const Color primaryDark = Color(0xFFB71C1C);
  static const Color primaryLight = Color(0xFFFFEBEE);
  static const Color backgroundColor = Color(0xFFF8F9FA); // Clean white/gray
  static const Color textColor = Color(0xFF212529);
  static const Color textLightColor = Color(0xFF6C757D);
  static const Color cardColor = Colors.white;

  static ThemeData get theme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: primaryDark,
        surface: cardColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      textTheme: GoogleFonts.interTextTheme().copyWith(
        displayLarge: GoogleFonts.outfit(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 56,
        ),
        displayMedium: GoogleFonts.outfit(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 48,
        ),
        headlineLarge: GoogleFonts.outfit(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
        headlineMedium: GoogleFonts.outfit(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
        titleLarge: GoogleFonts.outfit(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
        bodyLarge: GoogleFonts.inter(
          color: textLightColor,
          fontSize: 18,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.inter(
          color: textLightColor,
          fontSize: 16,
          height: 1.5,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryColor,
          side: const BorderSide(color: primaryColor, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.inter(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      cardTheme: CardThemeData(
        color: cardColor,
        elevation: 8,
        shadowColor: Colors.black.withValues(alpha: 0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        margin: EdgeInsets.zero,
      ),
    );
  }
}
