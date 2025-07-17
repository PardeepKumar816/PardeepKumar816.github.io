import 'package:flutter/widgets.dart';

class Project {
  final String name;
  final bool isProduct;
  final List<String> images;
  final String githubLink;
  final String playStoreLink;
  final String appStoreLink;
  final Gradient gradient;

  Project({
    required this.appStoreLink,
    required this.githubLink,
    required this.images,
    required this.isProduct,
    required this.name,
    required this.playStoreLink,
    required this.gradient,
  });
}
