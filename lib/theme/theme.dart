import 'package:flutter/material.dart';

// Tema do app

class AppThemes {
  static final lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color.fromRGBO(255, 117, 0, 1),
      secondary: Colors.deepOrange,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(255, 117, 0, 1),
    ),
  );

  static final darkTheme = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color.fromRGBO(255, 117, 0, 1),
      secondary: Colors.deepOrange,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromRGBO(255, 117, 0, 1),
    ),
  );
}
