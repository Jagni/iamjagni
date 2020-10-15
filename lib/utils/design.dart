import 'package:flutter/material.dart';

final primaryColor = Colors.green;
final cardColor = Colors.blueGrey[900];
final backgroundColor = Colors.blueGrey;

final appThemeData = ThemeData(
  primaryColor: primaryColor,
  appBarTheme: AppBarTheme(color: Colors.blueGrey[900]),
  primarySwatch: primaryColor,
  cardColor: cardColor,
  scaffoldBackgroundColor: Colors.blueGrey,
  brightness: Brightness.dark,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: cardColor,
      selectedItemColor: Colors.green,
      unselectedItemColor: backgroundColor),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

final darkAppThemeData = ThemeData(
  primaryColor: primaryColor,
  appBarTheme: AppBarTheme(color: Colors.blueGrey[900]),
  primarySwatch: primaryColor,
  cardColor: cardColor,
  scaffoldBackgroundColor: Colors.blueGrey[900],
  brightness: Brightness.dark,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: cardColor,
      selectedItemColor: Colors.green,
      unselectedItemColor: backgroundColor),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
