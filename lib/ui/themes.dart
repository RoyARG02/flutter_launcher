import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData buildTheme({bool themeBrightnessIsDark}) {
  final Color primaryColor =
      themeBrightnessIsDark ? Colors.black87 : Colors.white;
  final Color onPrimaryColor =
      themeBrightnessIsDark ? Colors.white : Colors.black;
  return ThemeData.from(
    colorScheme: ColorScheme(
      brightness: themeBrightnessIsDark ? Brightness.dark : Brightness.light,
      background: primaryColor,
      secondary: Colors.blue,
      error: Colors.red,
      primary: primaryColor,
      onBackground: onPrimaryColor,
      onError: Colors.white,
      onPrimary: onPrimaryColor,
      onSecondary: Colors.white,
      surface: Colors.blue,
      onSurface: Colors.white,
      primaryVariant: primaryColor,
      secondaryVariant: Colors.blue,
    ),
  );
}

SystemUiOverlayStyle buildSystemOverlayStyle({bool themeBrightnessIsDark}){
  return SystemUiOverlayStyle(
    statusBarColor: (themeBrightnessIsDark ? Colors.black: Colors.white).withOpacity(0.75),
      statusBarIconBrightness: themeBrightnessIsDark ? Brightness.light: Brightness.dark,
      //TODO: Determine whether it is necessary to set the navigation bar color
      systemNavigationBarColor: (themeBrightnessIsDark ? Colors.black: Colors.white).withOpacity(0.75),
      systemNavigationBarIconBrightness: themeBrightnessIsDark ? Brightness.light: Brightness.dark,
  );
}