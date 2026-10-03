class Experience {
  const Experience({
    required this.role,
    required this.company,
    required this.period,
    this.highlights = const <String>[],
    this.location,
    this.mode,
    this.stack = const <String>[],
    this.current = false,
  });

  final String role;
  final String company;
  final String period;
  final String? location;
  final String? mode;
  final List<String> highlights;
  final List<String> stack;
  final bool current;
}

class Education {
  const Education({
    required this.degree,
    required this.institution,
    required this.period,
    required this.detail,
  });

  final String degree;
  final String institution;
  final String period;
  final String detail;
}

class SkillGroup {
  const SkillGroup({required this.title, required this.skills});

  final String title;
  final List<Skill> skills;

  /// Skills that are named products or tools. Concepts are engineering
  /// practices, which have no brand mark by nature.
  ///
  /// Usually inferred from [Skill.hasIcon], but [Skill.tool] forces a real tool
  /// into this tier when no brand icon exists for it, so it is not demoted to a
  /// concept.
  List<Skill> get tools =>
      skills.where((Skill s) => s.hasIcon || s.tool).toList(growable: false);

  List<Skill> get concepts =>
      skills.where((Skill s) => !s.hasIcon && !s.tool).toList(growable: false);
}

class Skill {
  const Skill({required this.name, this.icon, this.tool = false});

  final String name;
  final String? icon;

  /// Marks a genuine tool that has no available brand icon.
  final bool tool;

  bool get hasIcon => icon != null;
}
