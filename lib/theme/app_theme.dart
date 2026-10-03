import 'package:flutter/material.dart';
import 'package:protfolio/theme/app_typography.dart';

abstract final class Brand {
  static const Color amber = Color(0xFFE3812A);
  static const Color crimson = Color(0xFFC8171E);
  static const Color gold = Color(0xFFE3C01C);

  static const LinearGradient warm = LinearGradient(
    colors: [gold, crimson],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient sunset = LinearGradient(
    colors: [amber, crimson],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const Color darkSurface = Color(0xFF141218);
  static const Color darkSurfaceAlt = Color(0xFF1D1A22);
  static const Color darkBorder = Color(0xFF2E2937);
}

abstract final class AppTheme {
  static ThemeData get dark {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: Brand.amber,
      brightness: Brightness.dark,
    ).copyWith(
      surface: Brand.darkSurface,
      surfaceContainerLowest: const Color(0xFF0E0C11),
      surfaceContainerLow: Brand.darkSurfaceAlt,
      surfaceContainer: const Color(0xFF241F2C),
      surfaceContainerHigh: const Color(0xFF2C2634),
      outlineVariant: Brand.darkBorder,
    );
    return _base(scheme);
  }

  static ThemeData get light {
    final ColorScheme scheme = ColorScheme.fromSeed(
      seedColor: Brand.crimson,
      brightness: Brightness.light,
    ).copyWith(
      surface: const Color(0xFFFCFAF8),
      surfaceContainerLowest: Colors.white,
      surfaceContainerLow: const Color(0xFFF6F2EE),
      surfaceContainer: const Color(0xFFF0EAE4),
      outlineVariant: const Color(0xFFE2DAD1),
    );
    return _base(scheme);
  }

  static ThemeData _base(ColorScheme scheme) {
    final bool isDark = scheme.brightness == Brightness.dark;
    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      fontFamily: 'Poppins',
      splashFactory: InkSparkle.splashFactory,
      visualDensity: VisualDensity.standard,
      dividerColor: scheme.outlineVariant,
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
      ),
      textTheme: AppTypography.build(scheme),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor:
            isDark ? scheme.surfaceContainerHigh : const Color(0xFF2A2430),
        contentTextStyle: TextStyle(
          fontFamily: 'Poppins',
          color: scheme.onSurface,
          fontSize: 14,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: scheme.inverseSurface,
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: TextStyle(color: scheme.onInverseSurface, fontSize: 12),
      ),
    );
  }
}
