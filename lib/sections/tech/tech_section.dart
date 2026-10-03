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
    return Section(
      key: SectionKeys.tech,
      id: SectionId.tech,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionHeader(
            title: 'Toolkit',
            subtitle: 'Named tools I work with day to day, and the engineering '
                'patterns I apply when a problem calls for one.',
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              const List<SkillGroup> groups = PortfolioData.skills;
              final bool twoUp = constraints.maxWidth >= 860;

              if (!twoUp) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    for (final SkillGroup group in groups)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: _Group(group: group),
                      ),
                  ],
                );
              }

              final List<SkillGroup> left = <SkillGroup>[];
              final List<SkillGroup> right = <SkillGroup>[];
              for (int i = 0; i < groups.length; i++) {
                (i.isEven ? left : right).add(groups[i]);
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (final SkillGroup group in left)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: _Group(group: group),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 48),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        for (final SkillGroup group in right)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30),
                            child: _Group(group: group),
                          ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _Group extends StatelessWidget {
  const _Group({required this.group});

  final SkillGroup group;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final List<Skill> tools = group.tools;
    final List<Skill> concepts = group.concepts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 14,
              height: 2,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 9),
            Flexible(
              child: Text(
                group.title,
                style: theme.textTheme.titleSmall?.copyWith(
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ],
        ),
        if (tools.isNotEmpty) ...<Widget>[
          const SizedBox(height: 16),
          const _TierLabel('Tools'),
          const SizedBox(height: 9),
          SkillGrid(skills: tools),
        ],
        if (concepts.isNotEmpty) ...<Widget>[
          const SizedBox(height: 16),
          const _TierLabel('Concepts'),
          const SizedBox(height: 7),
          ConceptList(skills: concepts),
        ],
      ],
    );
  }
}

/// Small uppercase caption that names which tier of a group is on screen, so an
/// unbranded practice never reads as a product with a broken icon.
class _TierLabel extends StatelessWidget {
  const _TierLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Text(
      text.toUpperCase(),
      style: theme.textTheme.labelSmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
        fontSize: 10,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
    );
  }
}
