import 'package:flutter/material.dart';
import 'package:protfolio/models/project_model.dart';
import 'package:protfolio/widgets/section.dart';
import 'package:protfolio/widgets/store_link_button.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  static String _initials(String name) {
    final List<String> parts = name
        .split(RegExp(r'[\s&]+'))
        .where((String p) => p.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts[1].substring(0, 1))
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;

    final Widget body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: Text(
                project.name,
                style: theme.textTheme.headlineSmall?.copyWith(height: 1.2),
              ),
            ),
            if (project.status != ProjectStatus.live) ...<Widget>[
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: _StatusChip(label: project.status.label),
              ),
            ],
          ],
        ),
        if (project.metric != null) ...<Widget>[
          const SizedBox(height: 8),
          Text(
            project.metric!,
            style: theme.textTheme.labelMedium?.copyWith(
              color: scheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        const SizedBox(height: 8),
        TextMeasure(
          child: Text(project.tagline, style: theme.textTheme.bodyMedium),
        ),
        if (project.highlights.isNotEmpty) ...<Widget>[
          const SizedBox(height: 14),
          for (final String point in project.highlights)
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8, right: 10),
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: scheme.primary,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(point, style: theme.textTheme.bodySmall),
                  ),
                ],
              ),
            ),
        ],
        if (project.stack.isNotEmpty) ...<Widget>[
          const SizedBox(height: 12),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: <Widget>[
              for (final String item in project.stack) _Tag(label: item),
            ],
          ),
        ],
        const SizedBox(height: 14),
        Row(
          children: <Widget>[
            for (int i = 0; i < project.links.length; i++) ...<Widget>[
              if (i > 0) const SizedBox(width: 8),
              StoreLinkButton(
                label: project.links[i].label,
                iconPath: project.links[i].iconPath,
                url: project.links[i].url,
                pendingMessage: project.links[i].pendingMessage,
              ),
            ],
            if (!project.hasLinks && !project.hasPendingLinks)
              Text(
                project.status == ProjectStatus.privateClient
                    ? 'Private client delivery — not publicly launched'
                    : 'No public link yet',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final bool stacked = constraints.maxWidth < 720;
          final Widget thumb = _Thumb(project: project);

          if (stacked) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: project.portraitImage ? 210 : 150,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: _Thumb(project: project, fill: true),
                  ),
                ),
                const SizedBox(height: 18),
                body,
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              thumb,
              const SizedBox(width: 28),
              Expanded(child: body),
            ],
          );
        },
      ),
    );
  }
}

class _Thumb extends StatelessWidget {
  const _Thumb({required this.project, this.fill = false});

  final Project project;
  final bool fill;

  @override
  Widget build(BuildContext context) {
    final Widget placeholder = DecoratedBox(
      decoration: BoxDecoration(gradient: project.gradient),
      child: Center(
        child: Text(
          ProjectCard._initials(project.name),
          style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.white70,
          ),
        ),
      ),
    );

    final double width = project.portraitImage ? 130 : 160;
    final double height = project.portraitImage ? 180 : 100;

    if (project.image == null) {
      return fill
          ? placeholder
          : SizedBox(width: width, height: height, child: placeholder);
    }

    final Widget image = Image.asset(
      project.image!,
      fit: BoxFit.cover,
      errorBuilder: (
        BuildContext context,
        Object error,
        StackTrace? stack,
      ) =>
          placeholder,
    );

    return fill
        ? image
        : ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(width: width, height: height, child: image),
          );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: scheme.onSurfaceVariant,
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    final ColorScheme scheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: scheme.outlineVariant),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 10.5,
          fontWeight: FontWeight.w600,
          color: scheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
