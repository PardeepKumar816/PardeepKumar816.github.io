import 'package:flutter/material.dart';
import 'package:protfolio/core/section_keys.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/models/portfolio_models.dart';
import 'package:protfolio/widgets/section.dart';
import 'package:protfolio/widgets/section_header.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    const List<Experience> roles = PortfolioData.experiences;

    return Section(
      key: SectionKeys.experience,
      id: SectionId.experience,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionHeader(
            title: 'Experience',
            subtitle: '${Profile.years} years across fintech, IoT, e-commerce, '
                'education and delivery.',
          ),
          const SizedBox(height: 40),
          for (int i = 0; i < roles.length; i++)
            _TimelineEntry(
              experience: roles[i],
              drawLine: i < roles.length - 1,
              lineColor: scheme.outlineVariant,
              dotColor: scheme.primary,
            ),
        ],
      ),
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  const _TimelineEntry({
    required this.experience,
    required this.drawLine,
    required this.lineColor,
    required this.dotColor,
  });

  final Experience experience;
  final bool drawLine;
  final Color lineColor;
  final Color dotColor;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;

    final String meta = <String>[
      if (experience.location != null) experience.location!,
      if (experience.mode != null) experience.mode!,
    ].join(' · ');

    final Widget content = Padding(
      padding: const EdgeInsets.fromLTRB(34, 0, 0, 34),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final Widget role = Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      experience.role,
                      style: theme.textTheme.titleLarge,
                    ),
                  ),
                  if (experience.current) ...<Widget>[
                    const SizedBox(width: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: scheme.primary.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        'Current',
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: scheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ],
              );

              if (constraints.maxWidth < 520) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    role,
                    const SizedBox(height: 4),
                    Text(
                      experience.period,
                      style: theme.textTheme.labelMedium,
                    ),
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: role),
                  const SizedBox(width: 20),
                  Text(
                    experience.period,
                    style: theme.textTheme.labelMedium,
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 3),
          Text(
            meta.isEmpty ? experience.company : '${experience.company} · $meta',
            style: theme.textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 14),
          for (final String point in experience.highlights)
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: TextMeasure(
                maxWidth: 760,
                child: Text(point, style: theme.textTheme.bodyMedium),
              ),
            ),
          if (experience.stack.isNotEmpty) ...<Widget>[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: <Widget>[
                for (final String item in experience.stack)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 9,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: scheme.outlineVariant),
                    ),
                    child: Text(
                      item,
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: scheme.onSurfaceVariant,
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        if (drawLine)
          Positioned(
            left: 4,
            top: 14,
            bottom: -14,
            child: Container(width: 1, color: lineColor),
          ),
        content,
        Positioned(
          left: 0,
          top: 6,
          child: Container(
            width: 9,
            height: 9,
            decoration: BoxDecoration(
              color: dotColor,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
