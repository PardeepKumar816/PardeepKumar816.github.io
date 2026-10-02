import 'package:flutter/material.dart';
import 'package:protfolio/theme/app_theme.dart';

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
        Container(
          width: 44,
          height: 3,
          decoration: BoxDecoration(
            gradient: Brand.sunset,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 18),
        Text(title, style: theme.textTheme.displaySmall),
        if (subtitle != null) ...<Widget>[
          const SizedBox(height: 12),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: Text(subtitle!, style: theme.textTheme.bodyLarge),
          ),
        ],
      ],
    );
  }
}