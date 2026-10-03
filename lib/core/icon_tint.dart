import 'dart:ui';

/// Icons are forced to a single colour derived from the active theme, so a
/// brand SVG that hardcodes its own fill can never disappear against the
/// background. `srcIn` replaces the source pixels outright.
ColorFilter monochrome(Color color) => ColorFilter.mode(color, BlendMode.srcIn);
