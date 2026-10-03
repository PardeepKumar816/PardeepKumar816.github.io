import 'package:flutter/material.dart';
import 'package:protfolio/widgets/section.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.alignment = CrossAxisAlignment.start,
  });

  final String title;
  final String? subtitle;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Column(
      crossAxisAlignment: alignment,
      children: <Widget>[
        Align(
          alignment: alignment == CrossAxisAlignment.center
              ? Alignment.center
              : Alignment.centerLeft,
          child: Container(
            width: 36,
            height: 2,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(height: 18),
        Text(
          title,
          style: theme.textTheme.displaySmall?.copyWith(height: 1.12),
        ),
        if (subtitle != null) ...<Widget>[
          const SizedBox(height: 14),
          TextMeasure(
            child: Text(subtitle!, style: theme.textTheme.bodyLarge),
          ),
        ],
      ],
    );
  }
}
