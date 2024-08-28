import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme(
      primary: Colors.white70, // font color
      brightness: Brightness.dark,
      onPrimary: Colors.white70,
      secondary: Colors.white70,
      onSecondary: Colors.white70,
      error: Colors.red,
      onError: Colors.white70,
      surface: Colors.black26, // background
      onSurface: Colors.white70, // font color
    onTertiary: Colors.white,
    inverseSurface: Colors.white,
    onInverseSurface: Colors.white,
onPrimaryContainer: Colors.white,
    onPrimaryFixed: Colors.white,

    inversePrimary: Colors.white,
    outline: Color(0x00e0e5ee),


  ),
);
