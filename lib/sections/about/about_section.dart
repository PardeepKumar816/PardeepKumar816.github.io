import 'package:flutter/material.dart';
import 'package:protfolio/core/section_keys.dart';
import 'package:protfolio/data/portfolio_data.dart';
import 'package:protfolio/theme/app_theme.dart';
import 'package:protfolio/widgets/section.dart';
import 'package:protfolio/widgets/section_header.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Section(
      key: SectionKeys.about,
      id: SectionId.about,
      tone: SectionTone.base,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SectionHeader(title: 'About me'),
          const SizedBox(height: 28),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final bool stacked = constraints.maxWidth < 780;
              final Widget bio = Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (final String paragraph
                      in PortfolioData.aboutBio.split('\n\n'))
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(paragraph, style: theme.textTheme.bodyLarge),
                    ),
                ],
              );

              final Widget quote = Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: Brand.sunset,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  PortfolioData.aboutQuote,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    height: 1.5,
                  ),
                ),
              );

              return stacked
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        bio,
                        const SizedBox(height: 8),
                        quote,
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(flex: 7, child: bio),
                        const SizedBox(width: 36),
                        Expanded(flex: 4, child: quote),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}