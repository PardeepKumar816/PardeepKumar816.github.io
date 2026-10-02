import 'package:flutter/material.dart';
import 'package:protfolio/core/breakpoints.dart';

class ContentWidth extends StatelessWidget {
  const ContentWidth({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1180),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Bp.pagePadding(Bp.width(context)),
          ),
          child: child,
        ),
      ),
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.id,
    required this.child,
    this.tone = SectionTone.base,
    this.verticalPadding,
  });

  final String id;
  final Widget child;
  final SectionTone tone;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final Color background = switch (tone) {
      SectionTone.base => scheme.surface,
      SectionTone.raised => scheme.surfaceContainerLow,
      SectionTone.sunken => scheme.surfaceContainerLowest,
    };
    final double pad = verticalPadding ??
        (Bp.isMobile(context) ? 56 : 88);

    return ColoredBox(
      color: background,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: pad),
        child: ContentWidth(child: child),
      ),
    );
  }
}

enum SectionTone { base, raised, sunken }