import 'package:flutter/material.dart';

abstract final class Bp {
  static const double mobileMax = 600;
  static const double tabletMax = 1000;

  static double width(BuildContext context) => MediaQuery.sizeOf(context).width;

  static bool isMobile(BuildContext context) => width(context) < mobileMax;

  static bool isTablet(BuildContext context) =>
      width(context) >= mobileMax && width(context) < tabletMax;

  static bool isDesktop(BuildContext context) => width(context) >= tabletMax;

  static int projectColumns(double width) {
    if (width >= 1500) return 4;
    if (width >= 1100) return 3;
    if (width >= 700) return 2;
    return 1;
  }

  static double pagePadding(double width) {
    if (width >= 1500) return 72;
    if (width >= 1100) return 48;
    if (width >= 700) return 32;
    return 20;
  }
}
