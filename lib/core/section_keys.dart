import 'package:flutter/material.dart';

abstract final class SectionKeys {
  static final GlobalKey home = GlobalKey();
  static final GlobalKey about = GlobalKey();
  static final GlobalKey experience = GlobalKey();
  static final GlobalKey tech = GlobalKey();
  static final GlobalKey projects = GlobalKey();
  static final GlobalKey education = GlobalKey();
  static final GlobalKey contact = GlobalKey();

  static final List<GlobalKey> ordered = [
    home,
    about,
    experience,
    tech,
    projects,
    education,
    contact,
  ];
}

abstract final class SectionId {
  static const String home = 'Home';
  static const String about = 'About';
  static const String experience = 'Experience';
  static const String tech = 'Tech';
  static const String projects = 'Projects';
  static const String education = 'Education';
  static const String contact = 'Contact';

  static const List<String> nav = [
    home,
    about,
    experience,
    tech,
    projects,
    education,
    contact,
  ];

  static GlobalKey keyFor(String id) {
    switch (id) {
      case about:
        return SectionKeys.about;
      case experience:
        return SectionKeys.experience;
      case tech:
        return SectionKeys.tech;
      case projects:
        return SectionKeys.projects;
      case education:
        return SectionKeys.education;
      case contact:
        return SectionKeys.contact;
      default:
        return SectionKeys.home;
    }
  }
}
