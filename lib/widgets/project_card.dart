import 'package:flutter/material.dart';
import 'package:protfolio/models/project_model.dart';
import 'package:protfolio/widgets/store_link_button.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.project,
    required this.height,
  });

  final Project project;
  final double height;

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
    final ColorScheme scheme = Theme.of(context).colorScheme;
    final double imageHeight = height * 0.42;

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: scheme.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: imageHeight,
            width: double.infinity,
            child: project.image == null
                ? DecoratedBox(
                    decoration: BoxDecoration(gradient: project.gradient),
                    child: Center(
                      child: Text(
                        _initials(project.name),
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  )
                : Image.asset(
                    project.image!,
                    fit: BoxFit.cover,
                    errorBuilder: (
                      BuildContext context,
                      Object error,
                      StackTrace? stack,
                    ) =>
                        DecoratedBox(
                      decoration: BoxDecoration(gradient: project.gradient),
                      child: Center(
                        child: Text(
                          _initials(project.name),
                          style: const TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: Colors.white70,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          project.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      if (project.isFlagged) ...<Widget>[
                        const SizedBox(width: 8),
                        const _FlagChip(label: 'Unavailable'),
                      ],
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    project.tagline,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  if (project.stack.isNotEmpty) ...<Widget>[
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: <Widget>[
                        for (final String item in project.stack)
                          _Tag(label: item),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                  Row(
                    children: <Widget>[
                      if (project.playStoreLink != null)
                        StoreLinkButton(
                          label: 'Play',
                          iconPath: 'assets/icons/google_play.svg',
                          url: project.playStoreLink,
                        ),
                      if (project.appStoreLink != null) ...<Widget>[
                        if (project.playStoreLink != null)
                          const SizedBox(width: 8),
                        Tooltip(
                          message: project.note ?? 'Open App Store',
                          child: StoreLinkButton(
                            label: 'App Store',
                            iconPath: 'assets/icons/appstore.svg',
                            url: project.appStoreLink,
                          ),
                        ),
                      ],
                      if (project.githubLink != null) ...<Widget>[
                        const SizedBox(width: 8),
                        StoreLinkButton(
                          label: 'GitHub',
                          iconPath: 'assets/icons/github.svg',
                          url: project.githubLink,
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
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
        color: scheme.primary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: scheme.primary,
        ),
      ),
    );
  }
}

class _FlagChip extends StatelessWidget {
  const _FlagChip({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.onTertiaryContainer,
        ),
      ),
    );
  }
}