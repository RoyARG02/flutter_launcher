import 'package:flutter/material.dart';

ThemeData buildTheme() {
  return ThemeData.from(
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        background: Colors.white,
        secondary: Colors.blue,
        error: Colors.red,
        primary: Colors.white,
        onBackground: Colors.black,
        onError: Colors.white,
        onPrimary: Colors.black,
        onSecondary: Colors.white,
        surface: Colors.blue,
        onSurface: Colors.white,
        primaryVariant: Colors.white,
        secondaryVariant: Colors.blue),
  );
}
