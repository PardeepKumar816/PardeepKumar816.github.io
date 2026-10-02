import 'package:flutter/widgets.dart';

class Project {
  const Project({
    required this.name,
    required this.tagline,
    required this.gradient,
    this.image,
    this.playStoreLink,
    this.appStoreLink,
    this.githubLink,
    this.stack = const [],
    this.note,
  });

  final String name;
  final String tagline;
  final String? image;
  final Gradient gradient;
  final String? playStoreLink;
  final String? appStoreLink;
  final String? githubLink;
  final List<String> stack;
  final String? note;

  bool get isFlagged => note != null;
}