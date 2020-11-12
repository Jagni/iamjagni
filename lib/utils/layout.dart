import 'dart:math';

import 'package:flutter/material.dart';

class AppLayout {
  static double appBarSize = 64;
  static double paddingSize = 16;
  static double maxContentHeight(BuildContext context) =>
      MediaQuery.of(context).size.height - kBottomNavigationBarHeight;

  static double maxContentWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var limitSize = width * 0.9;
    if (screenIsLarge(context)) {
      limitSize = width * 0.4;
    }
    return min(min(width - paddingSize * 2, limitSize), 800);
  }

  static bool screenIsLarge(BuildContext context) =>
      MediaQuery.of(context).size.width >= 720;

  static bool orientationIsVertical(BuildContext context) =>
      MediaQuery.of(context).size.width < MediaQuery.of(context).size.height;

  static int numberOfContentColumns(BuildContext context) =>
      !orientationIsVertical(context) || screenIsLarge(context) ? 3 : 2;
}
