import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:protfolio/core/icon_tint.dart';
import 'package:protfolio/models/portfolio_models.dart';

class SkillGrid extends StatelessWidget {
  const SkillGrid({super.key, required this.skills});

  final List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    if (skills.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final int columns = (constraints.maxWidth / 168).floor().clamp(2, 5);
        final double itemWidth =
            (constraints.maxWidth - (columns - 1) * 10) / columns;

        return Wrap(
          spacing: 10,
          runSpacing: 10,
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: scheme.outlineVariant),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (skill.hasIcon) ...<Widget>[
              ColorFiltered(
                colorFilter: monochrome(scheme.onSurface),
                child: SvgPicture.asset(skill.icon!, width: 17, height: 17),
              ),
              const SizedBox(width: 8),
            ],
            Flexible(
              child: Text(
                skill.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12.5,
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

/// Concepts and patterns have no logo in any icon library, so they are shown
/// as plain text rather than given invented artwork.
/// Renders skills that are engineering practices rather than products, so no
/// brand mark exists for them.
///
/// These are deliberately set as running muted text instead of bordered chips.
/// Drawing them as chips made them look like products whose icon had failed to
/// load, which misrepresented them and added a lot of visual noise.
class ConceptList extends StatelessWidget {
  const ConceptList({super.key, required this.skills});

  final List<Skill> skills;

  @override
  Widget build(BuildContext context) {
    if (skills.isEmpty) return const SizedBox.shrink();
    final ThemeData theme = Theme.of(context);

    return Text(
      skills.map((Skill skill) => skill.name).join('  ·  '),
      style: theme.textTheme.bodySmall?.copyWith(
        color: theme.colorScheme.onSurfaceVariant,
        height: 1.95,
      ),
    );
  }
}
