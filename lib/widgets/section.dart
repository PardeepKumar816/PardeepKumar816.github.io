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

/// Caps a run of prose at a comfortable measure so line lengths stay readable
/// on wide monitors instead of stretching edge to edge.
class TextMeasure extends StatelessWidget {
  const TextMeasure({super.key, required this.child, this.maxWidth = 680});

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: child,
    );
  }
}

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.id,
    required this.child,
    this.verticalPadding,
    this.divided = true,
  });

  final String id;
  final Widget child;
  final double? verticalPadding;
  final bool divided;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final double pad = verticalPadding ?? (Bp.isMobile(context) ? 60 : 92);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: scheme.surface,
        border: divided
            ? Border(top: BorderSide(color: scheme.outlineVariant))
            : null,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: pad),
        child: ContentWidth(child: child),
      ),
    );
  }
}
