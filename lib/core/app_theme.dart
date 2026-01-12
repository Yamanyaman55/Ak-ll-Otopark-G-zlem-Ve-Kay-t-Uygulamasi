import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Vibrant Palette
  static const Color primaryBlue = Color(0xFF2563EB); // Vibrant Blue
  static const Color primaryPurple = Color(0xFF7C3AED); // Vibrant Purple
  static const Color secondaryCyan = Color(0xFF06B6D4); // Cyan
  static const Color accentPink = Color(0xFFEC4899); // Pink
  static const Color backgroundLight = Color(0xFFF3F4F6);
  static const Color surfaceWhite = Colors.white;

  // Additional Colors
  static const Color secondaryGreen = Color(0xFF10B981); // Emerald Green
  static const Color errorRed = Color(0xFFEF4444); // Red
  static const Color accentAmber = Color(0xFFF59E0B); // Amber

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryBlue, primaryPurple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient cardGradient = LinearGradient(
    colors: [Colors.white, Color(0xFFF8FAFC)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFF0F172A), // Dark Slate Background
      colorScheme: ColorScheme.fromSeed(
        seedColor: secondaryGreen,
        primary: secondaryGreen, // Green Primary
        secondary: secondaryGreen,
        tertiary: secondaryGreen,
        surface: const Color(0xFF1E293B), // Dark surface
        background: const Color(0xFF0F172A),
        brightness: Brightness.dark, // Dark mode
      ),
      textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme).copyWith(
        displayLarge: const TextStyle(fontWeight: FontWeight.w800, color: Colors.white),
        headlineLarge: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        headlineMedium: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        titleLarge: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        bodyLarge: const TextStyle(color: Color(0xFF94A3B8)), // Slate 400
        bodyMedium: const TextStyle(color: Color(0xFFCBD5E1)), // Slate 300
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w800,
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: secondaryGreen, 
          foregroundColor: Colors.white, // Text color on button
          elevation: 4,
          shadowColor: secondaryGreen.withValues(alpha: 0.4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF1E293B), // Dark input bg
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: secondaryGreen, width: 2),
        ),
        contentPadding: const EdgeInsets.all(20),
        prefixIconColor: secondaryGreen,
        labelStyle: const TextStyle(color: Colors.grey),
        hintStyle: const TextStyle(color: Colors.grey),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF1E293B),
        elevation: 8,
        shadowColor: Colors.black.withValues(alpha: 0.2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Color(0xFF1E293B),
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
        ),
        elevation: 20,
      ),
      iconTheme: const IconThemeData(color: secondaryGreen),
    );
  }

  static BoxDecoration glassBoxDecoration({Color color = Colors.white, double opacity = 0.1}) {
    return BoxDecoration(
      color: color.withValues(alpha: opacity),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: Colors.white.withValues(alpha: 0.2),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          blurRadius: 16,
          offset: const Offset(0, 8),
        ),
      ],
    );
  }
}
