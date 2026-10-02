class Experience {
  const Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.summary,
    required this.highlights,
    this.location,
    this.stack = const [],
    this.current = false,
  });

  final String role;
  final String company;
  final String period;
  final String? location;
  final String summary;
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
}

class Skill {
  const Skill({required this.name, required this.icon});

  final String name;
  final String icon;
}