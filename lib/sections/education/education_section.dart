import 'package:flutter/material.dart';
import 'package:protfolio/core/section_keys.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/models/portfolio_models.dart';
import 'package:protfolio/widgets/section.dart';
import 'package:protfolio/widgets/section_header.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;

    return Section(
      key: SectionKeys.education,
      id: SectionId.education,
      tone: SectionTone.base,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionHeader(title: 'Education'),
          const SizedBox(height: 24),
          for (final Education item in PortfolioData.education)
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: scheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: scheme.outlineVariant),
              ),
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  final Widget left = Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(item.degree, style: theme.textTheme.titleMedium),
                      const SizedBox(height: 4),
                      Text(
                        item.institution,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: scheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  );
                  final Widget right = Text(
                    '${item.period} · ${item.detail}',
                    style: theme.textTheme.labelMedium,
                  );

                  return constraints.maxWidth < 560
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            left,
                            const SizedBox(height: 10),
                            right,
                          ],
                        )
                      : Row(
                          children: <Widget>[
                            Expanded(child: left),
                            right,
                          ],
                        );
                },
              ),
            ),
        ],
      ),
    );
  }
}