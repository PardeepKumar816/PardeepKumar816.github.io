import 'package:flutter/material.dart';
import 'package:protfolio/theme/app_theme.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.variant = ActionVariant.primary,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final ActionVariant variant;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final bool enabled = onPressed != null;

    late final Widget content = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (icon != null) ...<Widget>[
            Icon(icon, size: 18),
            const SizedBox(width: 10),
          ],
          Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );

    return Opacity(
      opacity: enabled ? 1 : 0.55,
      child: Material(
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: switch (variant) {
          ActionVariant.primary => Ink(
              decoration: BoxDecoration(
                gradient: Brand.sunset,
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: onPressed,
                child: DefaultTextStyle.merge(
                  style: TextStyle(color: scheme.onPrimary, fontSize: 14.5),
                  child: content,
                ),
              ),
            ),
          ActionVariant.secondary => InkWell(
              onTap: onPressed,
              child: Ink(
                decoration: BoxDecoration(
                  color: scheme.surfaceContainerLow,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: scheme.outlineVariant),
                ),
                child: DefaultTextStyle.merge(
                  style: TextStyle(color: scheme.onSurface, fontSize: 14.5),
                  child: content,
                ),
              ),
            ),
          ActionVariant.ghost => InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(12),
              child: DefaultTextStyle.merge(
                style: TextStyle(color: scheme.primary, fontSize: 14.5),
                child: content,
              ),
            ),
        },
      ),
    );
  }
}

enum ActionVariant { primary, secondary, ghost }