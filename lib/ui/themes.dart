import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Builds the theme used throughout the app.
///
/// The theme is derived from a [primaryColor] and an [accentColor].
///
/// [isDarkThemeBrightness] is delegated from [ThemeState.state] bloc,
/// which is defaultly false.
///
/// [primaryColor] is determined by [isDarkThemeBrightness], former
/// being assumed to be a derivative of [Colors.black] if the latter
/// is [Brightness.dark], and a derivative of [Colors.white] for
/// [Brightness.light]. Defaults to either [Colors.black] or
/// [Colors.white] respectively.
///
/// [accentColor] is unaffected by [isDarkThemeBrightness].
///
/// The [accentColor] can be supplied with any [Color]. If none is
/// provided, it defaults to [Colors.blue].
ThemeData buildTheme({
  @required bool isDarkThemeBrightness,
  Color primaryColor,
  Color accentColor,
}) {
  return ThemeData.from(
    colorScheme: ColorScheme(
      brightness: isDarkThemeBrightness ? Brightness.dark : Brightness.light,
      primary:
          primaryColor ?? isDarkThemeBrightness ? Colors.black : Colors.white,
      onPrimary: isDarkThemeBrightness ? Colors.white : Colors.black,
      background:
          primaryColor ?? isDarkThemeBrightness ? Colors.black : Colors.white,
      onBackground: isDarkThemeBrightness ? Colors.white : Colors.black,
      secondary: accentColor ?? Colors.blue,
      onSecondary:
          ThemeData.estimateBrightnessForColor(accentColor ?? Colors.white) ==
                  Brightness.dark
              ? Colors.white
              : Colors.black,
      error: Colors.red[700],
      onError: Colors.white,
      surface:
          primaryColor ?? isDarkThemeBrightness ? Colors.black : Colors.white,
      onSurface: isDarkThemeBrightness ? Colors.white : Colors.black,
      primaryVariant:
          primaryColor ?? isDarkThemeBrightness ? Colors.black : Colors.white,
      secondaryVariant: accentColor ?? Colors.blue,
    ),
  );
}

SystemUiOverlayStyle buildSystemOverlayStyle({bool isDarkThemeBrightness}) {
  final statusBarColor =
      (isDarkThemeBrightness ? Colors.black : Colors.white).withOpacity(0.75);
  //TODO: Determine whether it is necessary to set the navigation bar color
  final systemNavigationBarColor =
      isDarkThemeBrightness ? Colors.black : Colors.white;
  return (isDarkThemeBrightness
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark)
      .copyWith(
    statusBarColor: statusBarColor,
    systemNavigationBarColor: systemNavigationBarColor,
  );
}
