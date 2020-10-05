import 'dart:math';

import 'package:flutter/material.dart';

class AppLayout {
  static double appBarSize = 64;
  static double paddingSize = 16;
  static double maxContentHeight(BuildContext context) =>
      MediaQuery.of(context).size.height * 0.75 - paddingSize * 2 - appBarSize;

  static double maxContentWidth(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    double limitSize = width * 0.9;
    if (width > 720) {
      limitSize = width * 0.7;
    }
    return min(width - paddingSize * 2, limitSize);
  }

  static bool orientationIsVertical(BuildContext context) =>
      MediaQuery.of(context).size.width < MediaQuery.of(context).size.height;

  static int numberOfContentColumns(BuildContext context) =>
      !orientationIsVertical(context) ||
              MediaQuery.of(context).size.width >= 720
          ? 3
          : 2;
}
