import 'package:flutter/widgets.dart';

enum ProjectStatus { live, launchingSoon, privateClient, inDevelopment }

extension ProjectStatusLabel on ProjectStatus {
  String get label => switch (this) {
        ProjectStatus.live => 'Live',
        ProjectStatus.launchingSoon => 'Launching soon',
        ProjectStatus.privateClient => 'Private client',
        ProjectStatus.inDevelopment => 'In development',
      };
}

class ProjectLink {
  const ProjectLink({
    required this.label,
    this.url,
    this.iconPath,
    this.pendingMessage,
  });

  final String label;

  /// Null when the destination does not exist yet. Tapping the button then
  /// surfaces [pendingMessage] instead of opening anything.
  final String? url;
  final String? iconPath;
  final String? pendingMessage;

  bool get isLive => url != null && url!.trim().isNotEmpty;
}

class Project {
  const Project({
    required this.name,
    required this.tagline,
    required this.gradient,
    this.image,
    this.links = const <ProjectLink>[],
    this.stack = const <String>[],
    this.highlights = const <String>[],
    this.metric,
    this.status = ProjectStatus.live,
    this.portraitImage = false,
  });

  final String name;
  final String tagline;
  final String? image;
  final Gradient gradient;
  final List<ProjectLink> links;
  final List<String> stack;
  final List<String> highlights;
  final String? metric;
  final ProjectStatus status;
  final bool portraitImage;

  bool get hasLinks => links.any((ProjectLink link) => link.isLive);
  bool get hasPendingLinks => links.any((ProjectLink link) => !link.isLive);
}
