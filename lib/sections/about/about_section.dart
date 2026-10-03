import 'package:flutter/material.dart';
import 'package:protfolio/core/section_keys.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/models/portfolio_models.dart';
import 'package:protfolio/widgets/section.dart';
import 'package:protfolio/widgets/section_header.dart';
import 'package:protfolio/widgets/skill_grid.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Section(
      key: SectionKeys.about,
      id: SectionId.about,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionHeader(
            title: 'About me',
            subtitle:
                'An engineer who works across the whole path from idea to a '
                'shipped release.',
          ),
          const SizedBox(height: 24),
          for (final String paragraph in PortfolioData.aboutBio.split('\n\n'))
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: TextMeasure(
                maxWidth: 760,
                child: Text(paragraph, style: theme.textTheme.bodyLarge),
              ),
            ),
          const SizedBox(height: 4),
          Text('How I work', style: theme.textTheme.titleMedium),
          const SizedBox(height: 18),
          for (final SkillGroup group in PortfolioData.softSkills)
            Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    group.title,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: theme.colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ConceptList(skills: group.skills),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
