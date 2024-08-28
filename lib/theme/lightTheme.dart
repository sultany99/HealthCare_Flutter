import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme(
    // seedColor: Colors.black26,
    primary: Colors.black, // font color
    brightness: Brightness.light,
    onPrimary: Colors.white,
    secondary: Colors.black,
    onSecondary: Colors.black,
    error: Colors.red,
    onError: Colors.white,
    surface: Colors.white, // background
    onSurface: Colors.black, // font color
    // onTertiary: Colors.white,
    // inverseSurface: Colors.white,
  ),
);
