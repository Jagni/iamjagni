import 'package:flutter/material.dart';
import 'package:tinycolor/tinycolor.dart';

final darkPrimaryColor = Colors.green;
final darkCardColor = Colors.blueGrey[900];
final darkSheetColor = TinyColor(darkCardColor).darken(5).color;
final darkAccentColor = Colors.blueGrey;
final darkScaffoldBackgroundColor =
    TinyColor(darkCardColor).darken().darken(2).color;

final brightPrimaryColor = Colors.green[700];
//cfd8dc
final brightCardColor = TinyColor(Colors.blueGrey[50]).brighten(2).color;
final brightSheetColor = TinyColor(brightCardColor).brighten(2).color;
final brightAccentColor = Colors.blueGrey[900];
final brightScaffoldBackgroundColor = TinyColor(Colors.blueGrey[100]).color;

final brightAppThemeData = ThemeData(
  primaryColor: brightPrimaryColor,
  dividerColor: brightAccentColor,
  textTheme: TextTheme()
      .apply(bodyColor: brightAccentColor, displayColor: brightAccentColor),
  typography: Typography.material2018(),
  appBarTheme: AppBarTheme(color: Colors.blueGrey[900]),
  accentColor: brightAccentColor,
  cardColor: brightCardColor,
  scaffoldBackgroundColor: brightScaffoldBackgroundColor,
  brightness: Brightness.light,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: brightCardColor,
      selectedItemColor: brightPrimaryColor,
      unselectedItemColor: brightAccentColor),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: brightSheetColor),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final darkAppThemeData = ThemeData(
  primaryColor: darkPrimaryColor,
  dividerColor: darkAccentColor,
  appBarTheme: AppBarTheme(color: Colors.blueGrey[900]),
  primarySwatch: darkPrimaryColor,
  cardColor: darkCardColor,
  scaffoldBackgroundColor: darkScaffoldBackgroundColor,
  brightness: Brightness.dark,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: darkCardColor,
      selectedItemColor: darkPrimaryColor,
      unselectedItemColor: darkAccentColor),
  bottomSheetTheme: BottomSheetThemeData(backgroundColor: darkSheetColor),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
