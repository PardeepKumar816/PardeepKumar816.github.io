import 'package:flutter/material.dart';
import 'package:protfolio/models/portfolio_models.dart';
import 'package:protfolio/models/project_model.dart';
import 'package:protfolio/models/stat_model.dart';
import 'package:protfolio/theme/app_theme.dart';

abstract final class Profile {
  static const String name = 'Pardeep Kumar';
  static const String initials = 'PK';
  static const String title = 'Full Stack Mobile & Backend Engineer';
  static const String summary =
      'Full Stack Mobile & Backend Engineer with 5+ years shipping '
      'production software across fintech, healthcare, IoT and education. '
      'I have delivered 11 production applications, cut app size by 61% and '
      'reduced API latency by 40%. Currently building production-grade AI '
      'systems with LangChain, LangGraph and LangSmith.';

  static const String location = 'Karachi, Pakistan';
  static const String phone = '+92 335 3146121';
  static const String email = 'pardeepmalhi816@gmail.com';
  static const String linkedin =
      'https://linkedin.com/in/pardeep-kumar-a257221a1/';
  static const String github = 'https://github.com/PardeepKumar816';
  static const String resume =
      'https://drive.google.com/file/d/1qLNa9yYLFOkOLOHlI2DgP4H9mXwbkhYh/view?usp=sharing';
  static const String photo = 'assets/images/professional.jpeg';
  static const String photoFallback = 'assets/images/pardeep.png';
}

abstract final class PortfolioData {
  static const String aboutBio =
      'I bridge the gap between seamless user experiences and robust backend '
      'architecture. Holding a B.E. in Software Engineering from Mehran '
      'University of Engineering and Technology, I have spent the last four '
      'years turning complex requirements into scalable applications that reach '
      'real users.\n\n'
      'My work spans Flutter on the front end and Node.js, FastAPI and '
      'WebSocket services on the back, backed by PostgreSQL, Redis and cloud '
      'infrastructure. Recently I have been designing production AI workflows '
      'with LangChain, LangGraph and LangSmith, including retrieval-augmented '
      'generation and multi-agent orchestration, and engineering bespoke '
      'backend systems such as dynamic multi-location data retrieval. '
      'I previously spent two years working remotely on modular cross-platform '
      'applications, which makes me effective in distributed environments and '
      'ready to work worldwide.';

  static const String aboutQuote =
      'Success is built on continuous learning, innovation, and the courage '
      'to turn challenges into opportunities.';

  static const List<Experience> experiences = <Experience>[
    Experience(
      role: 'Full Stack Mobile & Backend Engineer',
      company: 'Irvinei OVAL',
      period: 'Feb 2026 - Present',
      current: true,
      summary:
          'Building mobile and backend systems end to end, with a focus on '
          'AI-assisted workflows and reliable multi-service APIs.',
      highlights: <String>[
        'Designed AI agent workflows with LangChain, LangGraph and LangSmith, '
            'covering retrieval-augmented generation and multi-agent routing.',
        'Engineered bespoke backend services for dynamic multi-location data '
            'retrieval and modelled the data layer for consistent reads.',
        'Built real-time features on WebSocket and REST APIs consumed by '
            'Flutter clients across Android and iOS.',
      ],
      stack: <String>[
        'Flutter',
        'Node.js',
        'Python',
        'LangGraph',
        'PostgreSQL'
      ],
    ),
    Experience(
      role: 'Software Engineer',
      company: 'EPlanet Global',
      period: 'Mar 2024 - Jan 2026',
      summary: 'Owned multiple client projects end to end, from architecture '
          'through to production release and support.',
      highlights: <String>[
        'Recognised as Employee of the Quarter for taking full ownership of '
            'multiple projects and shipping them to production.',
        'Reduced application size from 90MB to 35MB, a 61% improvement, '
            'through asset and dependency optimisation.',
        'Cut API latency by 40% by profiling hot endpoints and adding '
            'caching and indexing.',
        'Delivered cross-platform Flutter applications for fintech, retail '
            'and healthcare clients.',
      ],
      stack: <String>['Flutter', 'Dart', 'Node.js', 'MongoDB', 'Redis'],
    ),
    Experience(
      role: 'Software Engineer',
      company: 'Aditya Enterprises',
      period: 'Apr 2022 - Mar 2024',
      summary:
          'Developed production web and mobile features inside an engineering '
          'team, working directly with product stakeholders.',
      highlights: <String>[
        'Shipped production features across a large codebase with a focus on '
            'maintainability and test coverage.',
        'Integrated third-party payment and authentication flows.',
        'Worked with clients to translate requirements into shipped software.',
      ],
      stack: <String>['JavaScript', 'Node.js', 'Flutter', 'MySQL'],
    ),
    Experience(
      role: 'Flutter Developer',
      company: 'Alt-Ed',
      period: 'Feb 2022 - Sep 2022',
      summary: 'Built modular, cross-platform Flutter modules for an education '
          'platform.',
      highlights: <String>[
        'Developed reusable modular Flutter packages consumed by multiple '
            'product surfaces.',
        'Implemented responsive layouts and platform-specific behaviour.',
      ],
      stack: <String>['Flutter', 'Dart'],
    ),
    Experience(
      role: 'Flutter Developer',
      company: 'INTSFY',
      period: 'Oct 2021 - Dec 2021',
      summary:
          'Introduced Flutter to a JavaScript-heavy codebase and delivered '
          'the first mobile builds.',
      highlights: <String>[
        'Delivered the first Flutter mobile build for a JavaScript '
            'codebase.',
        'Established mobile build and release tooling.',
      ],
      stack: <String>['Flutter', 'JavaScript'],
    ),
  ];

  static const List<Education> education = <Education>[
    Education(
      degree: 'B.E. Software Engineering',
      institution: 'Mehran University of Engineering and Technology',
      period: '2019 - 2023',
      detail: 'CGPA 3.14 / 4.00',
    ),
  ];

  static const List<SkillGroup> skills = <SkillGroup>[
    SkillGroup(title: 'Mobile', skills: <Skill>[
      Skill(name: 'Flutter', icon: 'assets/icons/flutter.svg'),
      Skill(name: 'Dart', icon: 'assets/icons/dart.svg'),
      Skill(name: 'Android', icon: 'assets/icons/android.svg'),
      Skill(name: 'iOS', icon: 'assets/icons/apple.svg'),
    ]),
    SkillGroup(title: 'Backend & APIs', skills: <Skill>[
      Skill(name: 'Node.js', icon: 'assets/icons/node.svg'),
      Skill(name: 'Express.js', icon: 'assets/icons/express.svg'),
      Skill(name: 'REST APIs', icon: 'assets/icons/api.svg'),
      Skill(name: 'Dart Frog', icon: 'assets/icons/dart_frog.svg'),
      Skill(name: 'PostgreSQL', icon: 'assets/icons/postgresql.svg'),
      Skill(name: 'MongoDB', icon: 'assets/icons/mongo.svg'),
      Skill(name: 'MySQL', icon: 'assets/icons/sql.svg'),
      Skill(name: 'Redis', icon: 'assets/icons/redis.svg'),
      Skill(name: 'Firebase', icon: 'assets/icons/firebase.svg'),
    ]),
    SkillGroup(title: 'AI & Agentic', skills: <Skill>[
      Skill(name: 'Python', icon: 'assets/icons/python.svg'),
      Skill(name: 'LangChain', icon: 'assets/icons/langchain.svg'),
      Skill(name: 'LangGraph', icon: 'assets/icons/langgraph.svg'),
      Skill(name: 'LangSmith', icon: 'assets/icons/langsmith.svg'),
      Skill(name: 'FastAPI', icon: 'assets/icons/web.svg'),
    ]),
    SkillGroup(title: 'Cloud & DevOps', skills: <Skill>[
      Skill(name: 'Docker', icon: 'assets/icons/docker.svg'),
      Skill(name: 'AWS', icon: 'assets/icons/aws.svg'),
      Skill(name: 'GCP', icon: 'assets/icons/gcp.svg'),
      Skill(name: 'Azure', icon: 'assets/icons/azure.svg'),
    ]),
    SkillGroup(title: 'Tools & Practices', skills: <Skill>[
      Skill(name: 'Git', icon: 'assets/icons/git.svg'),
      Skill(name: 'GitHub', icon: 'assets/icons/github.svg'),
      Skill(name: 'Postman', icon: 'assets/icons/postman.svg'),
      Skill(name: 'Figma', icon: 'assets/icons/figma.svg'),
      Skill(name: 'Jira', icon: 'assets/icons/jira.svg'),
      Skill(name: 'HTML5', icon: 'assets/icons/html.svg'),
      Skill(name: 'CSS3', icon: 'assets/icons/css.svg'),
      Skill(name: 'JavaScript', icon: 'assets/icons/js.svg'),
    ]),
  ];

  static const List<Project> projects = <Project>[
    Project(
      name: 'ListCrime',
      tagline:
          'Crime reporting app letting residents submit incidents and track '
          'their status.',
      image: 'assets/images/projects/listcrime/listcrime.png',
      playStoreLink:
          'https://play.google.com/store/apps/details?id=com.listcrimellc.listcrimeapp',
      appStoreLink: 'https://apps.apple.com/pk/app/listcrime/id6741329363',
      stack: <String>['Flutter', 'Backend', 'Auth'],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFF00468C), Color(0xFF56C8D6)],
      ),
    ),
    Project(
      name: 'Save A Bite',
      tagline:
          'Food rescue platform connecting surplus food from restaurants to '
          'people who need it.',
      image: 'assets/images/projects/saveabite/saveabite.png',
      playStoreLink:
          'https://play.google.com/store/apps/details?id=com.dev.saveabite.save_a_bite',
      appStoreLink: 'https://apps.apple.com/pk/app/save-a-bite/id6746266615',
      stack: <String>['Flutter', 'Node.js', 'Realtime'],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFF017FDD), Color(0xFF4AA5E7)],
      ),
    ),
    Project(
      name: 'ChatSend',
      tagline: 'Real-time messaging application built on WebSocket delivery.',
      image: 'assets/images/projects/chatsend/chatsend.png',
      playStoreLink:
          'https://play.google.com/store/apps/details?id=com.dev.chatnsend',
      stack: <String>['Flutter', 'WebSockets', 'Node.js'],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFF2596BE), Color(0xFF1B6E8C)],
      ),
    ),
    Project(
      name: 'ILL-Lit Sports',
      tagline:
          'Youth sports platform covering tournaments, leaderboards, quizzes '
          'and parent and coach views.',
      image: 'assets/images/projects/litsports/feature-banner.jpg',
      playStoreLink:
          'https://play.google.com/store/apps/details?id=com.production.ill_lit_sports_app',
      appStoreLink: 'https://apps.apple.com/pk/app/ill-lit-sports/id6743541927',
      stack: <String>['Flutter', 'Node.js', 'Cloud Functions'],
      gradient: Brand.warm,
    ),
    Project(
      name: 'Warranty Database',
      tagline: 'Warranty and asset tracking system for consumer product '
          'guarantees and service history.',
      image: 'assets/images/projects/warranty/warranty.png',
      playStoreLink:
          'https://play.google.com/store/apps/details?id=com.trango.warranty.database.app',
      appStoreLink:
          'https://apps.apple.com/pk/app/warranty-database-direct/id6504633019',
      stack: <String>['Flutter', 'REST API', 'Cloud Functions'],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFFC1121F), Color(0xFFFF5A5F)],
      ),
    ),
    Project(
      name: 'ThrillPay',
      tagline:
          'Payments and wallet application covering categories, saved cards '
          'and QR-based transfers.',
      image: 'assets/images/projects/thrillpay/feature-banner.png',
      playStoreLink:
          'https://play.google.com/store/apps/details?id=com.trangotech.thrillpayapp',
      appStoreLink: 'https://apps.apple.com/us/app/thrillpay/id6749641663',
      note: 'App Store listing withdrawn at the client’s request',
      stack: <String>['Flutter', 'Payments', 'Security'],
      gradient: LinearGradient(
        colors: <Color>[
          Color(0xFFF3701B),
          Color(0xFFF80A60),
          Color(0xFFA216DC)
        ],
      ),
    ),
    Project(
      name: 'OceanicView',
      tagline: 'Social travel and photo-sharing app with personal chat and '
          'multi-language support.',
      image: 'assets/images/projects/oceanicview/oceanicview.png',
      appStoreLink:
          'https://apps.apple.com/pk/app/oceanicview-mart/id6733253406',
      stack: <String>['Flutter', 'Realtime', 'Payments'],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFFA57E29), Color(0xFFFFE09D)],
      ),
    ),
    Project(
      name: 'Pelican State Treating',
      tagline:
          'Field operations application for treatment records, locations and '
          'account management.',
      image: 'assets/images/projects/pelican/pelican.jpg',
      stack: <String>['Flutter', 'Forms', 'Reporting'],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFF2C5533), Color(0xFF4E8A5C)],
      ),
    ),
    Project(
      name: 'Funotel',
      tagline:
          'Hotel and travel platform with guest check-in, folio and service '
          'request modules.',
      stack: <String>['Flutter', 'Node.js', 'Payments'],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFF1F6F8B), Color(0xFF52A7BD)],
      ),
    ),
    Project(
      name: 'AI Travel Companion',
      tagline:
          'Itinerary planning assistant using retrieval-augmented generation '
          'over destination content.',
      stack: <String>['Python', 'LangGraph', 'FastAPI'],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFF6A2C8F), Color(0xFFB14BC4)],
      ),
    ),
    Project(
      name: 'InterviewAI',
      tagline: 'Agentic interview practice system with automated question flow '
          'and structured feedback.',
      stack: <String>['Python', 'LangChain', 'LangSmith'],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFF134E4A), Color(0xFF2F8F83)],
      ),
    ),
  ];

  static const List<Stat> stats = <Stat>[
    Stat(value: '4+', label: 'Years experience'),
    Stat(value: '11', label: 'Production apps'),
    Stat(value: '61%', label: 'App size reduced'),
    Stat(value: '40%', label: 'API latency cut'),
  ];
}
