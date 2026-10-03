import 'package:flutter/material.dart';
import 'package:protfolio/core/section_keys.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/widgets/project_card.dart';
import 'package:protfolio/widgets/section.dart';
import 'package:protfolio/widgets/section_header.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;

    return Section(
      key: SectionKeys.projects,
      id: SectionId.projects,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionHeader(
            title: 'Projects',
            subtitle:
                'Shipped applications and AI systems, with the work each one '
                'actually involved.',
          ),
          const SizedBox(height: 8),
          for (int i = 0; i < PortfolioData.projects.length; i++)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ProjectCard(project: PortfolioData.projects[i]),
                if (i < PortfolioData.projects.length - 1)
                  Divider(height: 1, color: scheme.outlineVariant),
              ],
            ),
        ],
      ),
    );
  }
}
