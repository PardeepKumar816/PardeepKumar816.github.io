import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protfolio/models/portfolio_models.dart';

class SkillGrid extends StatelessWidget {
  const SkillGrid({super.key, required this.skills});

  final List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final int columns =
            (constraints.maxWidth / 190).floor().clamp(2, 6);
        final double itemWidth =
            (constraints.maxWidth - (columns - 1) * 12) / columns;

        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: <Widget>[
            for (final Skill skill in skills)
              SizedBox(width: itemWidth, child: SkillTile(skill: skill)),
          ],
        );
      },
    );
  }
}

class SkillTile extends StatelessWidget {
  const SkillTile({super.key, required this.skill});

  final Skill skill;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Tooltip(
      message: skill.name,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: scheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: scheme.outlineVariant),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(skill.icon, width: 20, height: 20),
            const SizedBox(width: 9),
            Flexible(
              child: Text(
                skill.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: scheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}