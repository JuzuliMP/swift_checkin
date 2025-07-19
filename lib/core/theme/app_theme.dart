import 'package:flutter/material.dart';

/// AppTheme provides light and dark [ThemeData] for the application.
/// It centralizes color and style definitions for consistency and maintainability.
class AppTheme {
  // Dark Theme Colors
  static const _darkBackground = Color(0xFF030303);
  static const _darkSurface = Color(0xFF1C1C1C);
  static const _darkPrimary = Color(0xFFD2815E);
  static const _darkOnPrimary = Colors.white;
  static const _darkOnSurface = Colors.white;
  static const _darkSecondary = Color(0xFF666666);

  // Light Theme Colors
  static const _lightBackground = Color(0xFFF5F5F5);
  static const _lightSurface = Colors.white;
  static const _lightPrimary = Color(0xFFE67E22);
  static const _lightOnPrimary = Colors.white;
  static const _lightOnSurface = Color(0xFF333333);
  static const _lightSecondary = Color(0xFF888888);

  /// Returns the light [ThemeData].
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'DMSans',
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: const ColorScheme.light(
          primary: _lightPrimary,
          onPrimary: _lightOnPrimary,
          surface: _lightSurface,
          onSurface: _lightOnSurface,
          secondary: _lightSecondary,
        ),
        scaffoldBackgroundColor: _lightBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: _lightBackground,
          foregroundColor: _lightOnSurface,
          elevation: 0,
        ),
        elevatedButtonTheme:
            _elevatedButtonTheme(_lightPrimary, _lightOnPrimary),
        inputDecorationTheme: _inputDecorationTheme(
          fillColor: _lightSurface,
          borderColor: _lightSecondary,
          focusedBorderColor: _lightPrimary,
        ),
        snackBarTheme: _snackBarTheme(const Color(0xFFE74C3C)),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: _inputDecorationTheme(
            fillColor: _lightSurface,
            borderColor: _lightSecondary,
            focusedBorderColor: _lightPrimary,
          ),
        ),
      );

  /// Returns the dark [ThemeData].
  static ThemeData get darkTheme => ThemeData(
        fontFamily: 'DMSans',
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: _darkPrimary,
          onPrimary: _darkOnPrimary,
          surface: _darkSurface,
          onSurface: _darkOnSurface,
          secondary: _darkSecondary,
        ),
        scaffoldBackgroundColor: _darkBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: _darkBackground,
          foregroundColor: _darkOnSurface,
          elevation: 0,
        ),
        elevatedButtonTheme: _elevatedButtonTheme(_darkPrimary, _darkOnPrimary),
        inputDecorationTheme: _inputDecorationTheme(
          fillColor: _darkSurface,
          borderColor: _darkSecondary,
          focusedBorderColor: _darkPrimary,
        ),
        snackBarTheme: _snackBarTheme(const Color(0xFFB00020)),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: _darkBackground,
          selectedItemColor: _darkPrimary,
          unselectedItemColor: _darkSecondary,
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: _inputDecorationTheme(
            fillColor: _darkSurface,
            borderColor: _darkSecondary,
            focusedBorderColor: _darkPrimary,
          ),
        ),
      );

  /// Returns a reusable [ElevatedButtonThemeData].
  static ElevatedButtonThemeData _elevatedButtonTheme(
          Color background, Color foreground) =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: background,
          foregroundColor: foreground,
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  /// Returns a reusable [InputDecorationTheme].
  static InputDecorationTheme _inputDecorationTheme({
    required Color fillColor,
    required Color borderColor,
    required Color focusedBorderColor,
  }) =>
      InputDecorationTheme(
        filled: true,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.all(12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: focusedBorderColor),
        ),
      );

  /// Returns a reusable [SnackBarThemeData].
  static SnackBarThemeData _snackBarTheme(Color backgroundColor) =>
      SnackBarThemeData(
        backgroundColor: backgroundColor,
        contentTextStyle:
            const TextStyle(color: Colors.white, fontFamily: 'DMSans'),
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      );
}
