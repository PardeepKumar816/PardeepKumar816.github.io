import 'package:flutter/material.dart';
import 'package:protfolio/core/section_keys.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/models/portfolio_models.dart';
import 'package:protfolio/widgets/section.dart';
import 'package:protfolio/widgets/section_header.dart';
import 'package:protfolio/widgets/skill_grid.dart';

class TechSection extends StatelessWidget {
  const TechSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Section(
      key: SectionKeys.tech,
      id: SectionId.tech,
      tone: SectionTone.base,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionHeader(
            title: 'Tech stack',
            subtitle:
                'Tools I reach for most often, from mobile through backend, '
                'AI systems and the cloud that runs them.',
          ),
          const SizedBox(height: 32),
          for (final SkillGroup group in PortfolioData.skills) ...<Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Text(group.title, style: theme.textTheme.titleSmall),
              ],
            ),
            const SizedBox(height: 12),
            SkillGrid(skills: group.skills),
            const SizedBox(height: 28),
          ],
        ],
      ),
    );
  }
}