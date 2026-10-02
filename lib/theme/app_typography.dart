import 'package:flutter/material.dart';

abstract final class AppTypography {
  static TextTheme build(ColorScheme scheme) {
    final Color heading = scheme.onSurface;
    final Color muted = scheme.onSurfaceVariant;

    TextStyle h(double size, FontWeight weight, {double? height, Color? color}) =>
        TextStyle(
          fontFamily: 'Montserrat',
          fontSize: size,
          fontWeight: weight,
          height: height,
          letterSpacing: -0.4,
          color: color ?? heading,
        );

    TextStyle b(double size, FontWeight weight, {double? height, Color? color}) =>
        TextStyle(
          fontFamily: 'Poppins',
          fontSize: size,
          fontWeight: weight,
          height: height,
          color: color ?? heading,
        );

    return TextTheme(
      displayLarge: h(56, FontWeight.w700, height: 1.1),
      displayMedium: h(44, FontWeight.w700, height: 1.15),
      displaySmall: h(34, FontWeight.w700, height: 1.2),
      headlineMedium: h(28, FontWeight.w700, height: 1.25),
      headlineSmall: h(22, FontWeight.w700, height: 1.3),
      titleLarge: h(18, FontWeight.w600, height: 1.35),
      titleMedium: b(16, FontWeight.w600, height: 1.4),
      titleSmall: b(14, FontWeight.w600, height: 1.4),
      bodyLarge: b(16, FontWeight.w400, height: 1.65, color: muted),
      bodyMedium: b(14.5, FontWeight.w400, height: 1.7, color: muted),
      bodySmall: b(13, FontWeight.w400, height: 1.6, color: muted),
      labelLarge: b(14, FontWeight.w600, height: 1.2),
      labelMedium: b(12.5, FontWeight.w500, height: 1.2),
      labelSmall: b(11, FontWeight.w500, height: 1.2),
    );
  }
}