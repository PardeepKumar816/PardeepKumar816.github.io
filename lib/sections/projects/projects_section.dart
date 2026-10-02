import 'package:flutter/material.dart';
import 'package:protfolio/core/breakpoints.dart';
import 'package:protfolio/core/section_keys.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/models/project_model.dart';
import 'package:protfolio/widgets/project_card.dart';
import 'package:protfolio/widgets/section.dart';
import 'package:protfolio/widgets/section_header.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static double cardHeight(int columns) =>
      columns == 1 ? 420 : (columns == 2 ? 392 : 372);

  @override
  Widget build(BuildContext context) {
    return Section(
      key: SectionKeys.projects,
      id: SectionId.projects,
      tone: SectionTone.raised,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionHeader(
            title: 'Projects',
            subtitle:
                'Production applications and AI systems I have designed, '
                'built and shipped.',
          ),
          const SizedBox(height: 30),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final int cols = Bp.projectColumns(constraints.maxWidth);
              final double itemHeight = cardHeight(cols);

              return Wrap(
                spacing: 20,
                runSpacing: 20,
                children: <Widget>[
                  for (final Project project in PortfolioData.projects)
                    SizedBox(
                      width: (constraints.maxWidth - (cols - 1) * 20) / cols,
                      child: ProjectCard(
                        project: project,
                        height: itemHeight,
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