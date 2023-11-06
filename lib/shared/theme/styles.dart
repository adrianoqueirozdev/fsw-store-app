import 'package:flutter/material.dart';

sealed class Styles {
  static TextTheme textTheme() {
    return const TextTheme(
      bodySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: Colors.white,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.5,
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: Colors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        color: Colors.white,
      ),
      titleLarge: TextStyle(
        fontSize: 23,
        color: Colors.white,
      ),
      headlineSmall: TextStyle(
        fontSize: 25,
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 29,
        color: Colors.white,
      ),
      headlineLarge: TextStyle(
        fontSize: 33,
        color: Colors.white,
      ),
      displaySmall: TextStyle(
        fontSize: 37,
        color: Colors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 46,
        color: Colors.white,
      ),
      displayLarge: TextStyle(
        fontSize: 58,
        letterSpacing: -0.25,
        color: Colors.white,
      ),
    );
  }
}
