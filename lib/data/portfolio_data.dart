import 'package:flutter/material.dart';
import 'package:protfolio/models/portfolio_models.dart';
import 'package:protfolio/models/project_model.dart';
import 'package:protfolio/models/stat_model.dart';
import 'package:protfolio/theme/app_theme.dart';

const String _i = 'assets/icons/';

abstract final class Profile {
  static const String name = 'Pardeep Kumar';
  static const String title = 'Full Stack Mobile & Backend Engineer';
  static const String focus = 'Flutter · Node.js · AI/GenAI';

  /// Single source of truth for the experience claim.
  static const String years = '5+';

  static const String summary =
      'Full Stack Software Engineer specialising in Flutter mobile development '
      'and Node.js backend systems, with 5+ years shipping production '
      'applications across fintech, delivery, e-commerce, sports, education and '
      'IoT. Experienced building cross-platform Flutter apps for Android and '
      'iOS, Node.js/Express and Python/FastAPI backends, REST APIs, WebSocket '
      'services and PostgreSQL data layers, alongside real-time integrations '
      '(WebRTC, Bluetooth, IoT device control). Also experienced building '
      'Generative AI and agentic systems — multi-agent LangGraph workflows, RAG '
      'pipelines, and LLM evaluation/observability using LangChain and '
      'LangSmith.';

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
      'Having graduated with a B.E. in Software Engineering from Mehran '
      'University of Engineering and Technology, I have spent five years '
      'turning ambiguous requirements into production software across fintech, '
      'delivery, e-commerce, sports, education and IoT.\n\n'
      'Most of my work sits on both sides of the wire: Flutter on the front '
      'end, Node.js, Express and FastAPI on the back, PostgreSQL underneath, '
      'and WebSocket services wherever the product needs to feel live. Shipping '
      'is the unglamorous half too — cutting a 90MB app down to 35MB, trimming '
      'API latency by 40%, and keeping offline caching honest on patchy mobile '
      'networks.\n\n'
      'Lately I have been building generative AI systems properly rather than '
      'demoing them: multi-agent LangGraph workflows with human-in-the-loop '
      'approval, retrieval pipelines over structured and unstructured sources, '
      'and tracing every run in LangSmith so behaviour can be evaluated instead '
      'of guessed at. Earlier remote work taught me how to hold momentum across '
      'time zones and client teams.';

  static const List<Experience> experiences = <Experience>[
    Experience(
      role: 'Full Stack Mobile & Backend Engineer',
      company: 'Irvinei OVAL',
      period: 'Feb 2026 - Present',
      location: 'Karachi, Pakistan',
      mode: 'On-site',
      current: true,
      stack: <String>[
        'Flutter',
        'Dart',
        'Kotlin',
        'Android',
        'Node.js',
        'Express',
        'REST APIs',
        'JWT',
        'WebSocket',
        'WebRTC',
        'FCM',
        'Home Assistant',
        'IoT',
        'LangGraph',
        'RAG',
      ],
      highlights: <String>[
        'Contributed to the OVAL smart-home platform across the Flutter app, the '
            'native Kotlin smart-doorbell application, and the Node.js backend.',
        'Maintained Node.js/Express and WebSocket backend services supporting '
            'IoT device APIs and real-time data pipelines across smart-doorbell, '
            'WebRTC, Bluetooth, and WiFi systems.',
        'Integrated Home Assistant APIs, real-time IoT events, and structured '
            'tool execution with human-approval controls for sensitive '
            'automation actions.',
        'Designed and implemented LLM and agentic workflows using LangGraph, '
            'LangChain, and LangSmith for AI-driven smart-home and internal '
            'operations.',
        'Built RAG pipelines combining structured device knowledge, policy '
            'documents, and real-time IoT context for contextual reasoning and '
            'intelligent automation.',
      ],
    ),
    Experience(
      role: 'Full Stack Software Engineer',
      company: 'EPlanet Global',
      period: 'Mar 2024 - Jan 2026',
      location: 'Karachi, Pakistan',
      mode: 'On-site',
      stack: <String>[
        'Flutter',
        'Node.js',
        'Express',
        'REST APIs',
        'JWT',
        'Firebase',
        'Supabase',
        'MongoDB',
        'MySQL',
        'Third-Party Integrations',
        'PostgreSQL',
        'Toast POS',
        'LangChain',
        'LangSmith',
      ],
      highlights: <String>[
        'Supported 11 production applications across fintech, delivery, '
            'e-commerce, and sports; recognized as Employee of the Quarter for '
            'ownership and delivery.',
        'Reduced API latency by 40% through query optimization and database '
            'indexing; maintained Node.js/Express REST APIs with JWT and RBAC.',
        'Integrated Toast POS across orders, menus, customers, payments, and '
            'inventory; automated MySQL backups and MySQL-to-PostgreSQL '
            'migration.',
        'Built and integrated AI/LLM workflows using LangGraph, LangChain, and '
            'LangSmith for multi-agent travel experiences and AI interview '
            'workflows.',
        'Designed multi-agent architectures coordinating specialized agents for '
            'planning, booking, payments, group collaboration, and expense '
            'tracking with Stripe and WebSocket integrations.',
      ],
    ),
    Experience(
      role: 'Full Stack Software Engineer',
      company: 'Aditya Enterprises',
      period: 'Apr 2022 - Mar 2024',
      mode: 'Remote',
      stack: <String>[
        'Flutter',
        'Node.js',
        'Express',
        'REST APIs',
        'JWT',
        'Firebase',
        'MongoDB',
        'FFmpeg',
        'Platform Channels',
        'Third-Party Integrations',
      ],
      highlights: <String>[
        'Developed cross-platform applications and backend services using '
            'Flutter, Node.js, MySQL, MongoDB, REST APIs, and JWT '
            'authentication.',
        'Replaced a third-party FFmpeg package with a custom native '
            'implementation through Flutter Platform Channels, and handled API '
            'validation and secure communication.',
      ],
    ),
    Experience(
      role: 'Flutter Developer (Part-time)',
      company: 'Alt-Ed',
      period: 'Feb 2022 - Sep 2022',
      location: 'Hyderabad, Pakistan',
      mode: 'Remote',
      stack: <String>[
        'Flutter',
        'Dart',
        'Firebase',
        'FCM',
        'REST APIs',
        'Provider',
        'GetX',
        'BLoC',
      ],
      highlights: <String>[
        'Built Flutter features and reusable components using Provider and GetX, '
            'focusing on responsive interfaces and performance-optimized '
            'widget trees.',
      ],
    ),
    Experience(
      role: 'Flutter Developer Intern',
      company: 'INTSFY',
      period: 'Oct 2021 - Dec 2021',
      location: 'Hyderabad, Pakistan',
      stack: <String>[
        'Flutter',
        'Dart',
        'Firebase',
        'FCM',
        'REST APIs',
      ],
      highlights: <String>[
        'Assisted with feature development, testing, debugging, UI '
            'implementation, and performance optimization for Flutter '
            'applications.',
      ],
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
    SkillGroup(title: 'Mobile & Frontend', skills: <Skill>[
      Skill(name: 'Flutter', icon: '${_i}flutter.svg'),
      Skill(name: 'Dart', icon: '${_i}dart.svg'),
      Skill(name: 'React', icon: '${_i}react.svg'),
      Skill(name: 'Kotlin', icon: '${_i}kotlin.svg'),
      Skill(name: 'Swift', icon: '${_i}swift.svg'),
      Skill(name: 'GetX', icon: '${_i}getx.svg'),
      Skill(name: 'WebRTC', icon: '${_i}webrtc.svg'),
      Skill(name: 'BLoC'),
      Skill(name: 'Provider'),
      Skill(name: 'Platform Channels'),
    ]),
    SkillGroup(title: 'Backend & APIs', skills: <Skill>[
      Skill(name: 'Node.js', icon: '${_i}node.svg'),
      Skill(name: 'Express.js', icon: '${_i}express.svg'),
      Skill(name: 'GraphQL', icon: '${_i}graphql.svg'),
      Skill(name: 'Socket.IO', icon: '${_i}socketdotio.svg'),
      Skill(name: 'Webhooks'),
      Skill(name: 'WebSocket'),
      Skill(name: 'JWT'),
      Skill(name: 'OAuth 2.0'),
      Skill(name: 'RBAC'),
    ]),
    SkillGroup(title: 'Data & Infrastructure', skills: <Skill>[
      Skill(name: 'PostgreSQL', icon: '${_i}postgresql.svg'),
      Skill(name: 'MySQL', icon: '${_i}mysql.svg'),
      Skill(name: 'MongoDB', icon: '${_i}mongo.svg'),
      Skill(name: 'Supabase', icon: '${_i}supabase.svg'),
      Skill(name: 'Firebase', icon: '${_i}firebase.svg'),
      Skill(name: 'Docker', icon: '${_i}docker.svg'),
      Skill(name: 'AWS', icon: '${_i}aws.svg'),
      Skill(name: 'Google Cloud', icon: '${_i}gcp.svg'),
      Skill(name: 'GitHub', icon: '${_i}github.svg'),
      Skill(name: 'pgvector'),
      Skill(name: 'ChromaDB'),
      Skill(name: 'FAISS'),
      Skill(name: 'Vector Stores'),
      Skill(name: 'Embedding Pipelines'),
    ]),
    SkillGroup(title: 'Integrations & Payments', skills: <Skill>[
      Skill(name: 'Stripe', icon: '${_i}stripe.svg'),
      Skill(name: 'RevenueCat', icon: '${_i}revenuecat.svg'),
      Skill(name: 'Home Assistant', icon: '${_i}homeassistant.svg'),
      Skill(name: 'Google Maps', icon: '${_i}googlemaps.svg'),
      Skill(name: 'Agora', icon: '${_i}agora.svg'),
      Skill(name: 'Toast POS'),
      Skill(name: 'Payment APIs'),
    ]),
    SkillGroup(title: 'AI & Agentic Systems', skills: <Skill>[
      Skill(name: 'LangChain', icon: '${_i}langchain.svg'),
      Skill(name: 'LangGraph', icon: '${_i}langgraph.svg'),
      Skill(name: 'LangSmith', icon: '${_i}langsmith.svg'),
      Skill(name: 'Multi-Agent Systems'),
      Skill(name: 'Agentic Workflows'),
      Skill(name: 'Stateful Graphs'),
      Skill(name: 'Supervisor/Parallel Workflows'),
      Skill(name: 'ReAct'),
      Skill(name: 'Tool Calling'),
      Skill(name: 'Structured Outputs'),
      Skill(name: 'Human-in-the-Loop'),
      Skill(name: 'LLM Evaluation'),
      Skill(name: 'Observability'),
    ]),
    SkillGroup(title: 'LLMs & Retrieval', skills: <Skill>[
      Skill(name: 'OpenAI', icon: '${_i}openai.svg'),
      Skill(name: 'Claude', icon: '${_i}anthropic.svg'),
      Skill(name: 'Gemini', icon: '${_i}googlegemini.svg'),
      Skill(name: 'Llama 3', icon: '${_i}meta.svg'),
      Skill(name: 'Hugging Face', icon: '${_i}huggingface.svg'),
      Skill(name: 'RAG'),
      Skill(name: 'Vector Search'),
      Skill(name: 'Hybrid Search'),
      Skill(name: 'Cross-Encoder Reranking'),
      Skill(name: 'Metadata Filtering'),
      Skill(name: 'Sentence Transformers'),
      Skill(name: 'Groq'),
      Skill(name: 'Tavily'),
    ]),
    SkillGroup(title: 'AI Coding Agents', skills: <Skill>[
      Skill(name: 'Claude Code', icon: '${_i}claudecode.svg'),
      Skill(name: 'Cursor', icon: '${_i}cursor.svg'),
      Skill(name: 'OpenCode', icon: '${_i}opencode.svg'),
      Skill(name: 'Antigravity', tool: true),
    ]),
    SkillGroup(title: 'Prompt Engineering', skills: <Skill>[
      Skill(name: 'Few-Shot'),
      Skill(name: 'Zero-Shot'),
      Skill(name: 'Role-Based Prompting'),
      Skill(name: 'Structured Output Prompting'),
      Skill(name: 'Prompt Versioning'),
      Skill(name: 'Guardrails'),
    ]),
    SkillGroup(title: 'Languages & Tools', skills: <Skill>[
      Skill(name: 'TypeScript', icon: '${_i}typescript.svg'),
      Skill(name: 'JavaScript', icon: '${_i}js.svg'),
      Skill(name: 'Python', icon: '${_i}python.svg'),
      Skill(name: 'Java', icon: '${_i}java.svg'),
      Skill(name: 'Git', icon: '${_i}git.svg'),
      Skill(name: 'Bitbucket', icon: '${_i}bitbucket.svg'),
      Skill(name: 'Postman', icon: '${_i}postman.svg'),
      Skill(name: 'Android Studio', icon: '${_i}androidstudio.svg'),
      Skill(name: 'Xcode', icon: '${_i}xcode.svg'),
      Skill(name: 'VS Code', icon: '${_i}visualstudiocode.svg'),
    ]),
  ];

  static const List<Project> projects = <Project>[
    Project(
      name: 'Save A Bite',
      tagline:
          'Delivery platform covering order management, real-time tracking and '
          'payment processing.',
      image: 'assets/images/projects/saveabite/saveabite.png',
      status: ProjectStatus.live,
      links: <ProjectLink>[
        ProjectLink(
          label: 'Play',
          url:
              'https://play.google.com/store/apps/details?id=com.dev.saveabite.save_a_bite',
          iconPath: '${_i}google_play.svg',
        ),
        ProjectLink(
          label: 'App Store',
          url: 'https://apps.apple.com/pk/app/save-a-bite/id6746266615',
          iconPath: '${_i}appstore.svg',
        ),
      ],
      stack: <String>[
        'Flutter',
        'Node.js',
        'Express.js',
        'MySQL',
        'BLoC',
        'Stripe',
        'Socket.IO',
        'Google Maps',
      ],
      highlights: <String>[
        'Built and shipped the full delivery platform end to end as sole '
            'developer — order management, real-time tracking and payments.',
        'Integrated Stripe payments, FCM notifications and offline caching for '
            'unreliable network conditions.',
        'Shipped live rider tracking using Google Maps, Geocoding and '
            'Geolocator.',
      ],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFF017FDD), Color(0xFF4AA5E7)],
      ),
    ),
    Project(
      name: 'ILL-Lit Sports',
      tagline:
          'Recruiting platform where student athletes build profiles with video '
          'highlights and connect with college coaches.',
      image: 'assets/images/projects/litsports/feature-banner.jpg',
      status: ProjectStatus.live,
      metric: '90 MB → 35 MB',
      links: <ProjectLink>[
        ProjectLink(
          label: 'Play',
          url:
              'https://play.google.com/store/apps/details?id=com.production.ill_lit_sports_app',
          iconPath: '${_i}google_play.svg',
        ),
        ProjectLink(
          label: 'App Store',
          url: 'https://apps.apple.com/pk/app/ill-lit-sports/id6743541927',
          iconPath: '${_i}appstore.svg',
        ),
      ],
      stack: <String>[
        'Flutter',
        'Firebase',
        'Node.js',
        'Express.js',
        'MySQL',
        'Agora',
        'WebSocket',
        'BLoC',
        'Stripe',
      ],
      highlights: <String>[
        'Shipped a recruiting platform where student athletes build profiles '
            'with video highlights and performance metrics, connecting them '
            'directly with college coaches.',
        'Integrated Agora video and audio calling with WebSocket real-time chat '
            'for coach-to-athlete communication.',
        'Reduced app size from 90 MB to 35 MB (~61%) by eliminating heavy '
            'dependencies and resizing static assets, significantly improving '
            'install conversion.',
        'Added FCM push notifications, offline caching and location services, and '
            'shipped the app to both stores.',
      ],
      gradient: Brand.warm,
    ),
    Project(
      name: 'ChatSend',
      tagline: 'Fintech app for secure financial transaction workflows with '
          'server-side validation.',
      image: 'assets/images/projects/chatsend/chatsend.png',
      status: ProjectStatus.live,
      links: <ProjectLink>[
        ProjectLink(
          label: 'Play',
          url:
              'https://play.google.com/store/apps/details?id=com.dev.chatnsend',
          iconPath: '${_i}google_play.svg',
        ),
      ],
      stack: <String>[
        'Flutter',
        'Node.js',
        'BLoC',
        'Stripe',
        'JWT',
        'MySQL',
        'Socket.IO',
        'WebRTC'
      ],
      highlights: <String>[
        'Built secure financial transaction workflows with Stripe and '
            'server-side validation across a Flutter and Node.js stack.',
        'Implemented JWT authentication and hardened API handling to protect '
            'sensitive financial user data.',
      ],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFF2596BE), Color(0xFF1B6E8C)],
      ),
    ),
    Project(
      name: 'Warranty Database Direct',
      tagline: 'Stores purchases, tracks warranty expiry and routes claims to '
          'manufacturers and insurers.',
      image: 'assets/images/projects/warranty/warranty.png',
      status: ProjectStatus.live,
      links: <ProjectLink>[
        ProjectLink(
          label: 'Play',
          url:
              'https://play.google.com/store/apps/details?id=com.trango.warranty.database.app',
          iconPath: '${_i}google_play.svg',
        ),
        ProjectLink(
          label: 'App Store',
          url:
              'https://apps.apple.com/pk/app/warranty-database-direct/id6504633019',
          iconPath: '${_i}appstore.svg',
        ),
      ],
      stack: <String>[
        'Flutter',
        'Node.js',
        'Firebase',
        'BLoC',
        'MVVM',
      ],
      highlights: <String>[
        'Built a warranty management platform that stores purchases, tracks '
            'expiry dates and routes claims directly to manufacturers and '
            'insurance carriers for registration.',
        'Designed around a real problem — busy professionals, students and '
            'parents all lose track of what is still under warranty.',
        'Shipped v3.0.0 across iOS and Android with a Flutter client and Node.js '
            'backend.',
      ],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFFC1121F), Color(0xFFFF5A5F)],
      ),
    ),
    Project(
      name: 'ListCrime',
      tagline:
          'Combat cybercrime with real-time alerts, education and reporting '
          'tools.',
      image: 'assets/images/projects/listcrime/listcrime.png',
      status: ProjectStatus.live,
      links: <ProjectLink>[
        ProjectLink(
          label: 'Play',
          url:
              'https://play.google.com/store/apps/details?id=com.listcrimellc.listcrimeapp',
          iconPath: '${_i}google_play.svg',
        ),
        ProjectLink(
          label: 'App Store',
          url: 'https://apps.apple.com/pk/app/listcrime/id6741329363',
          iconPath: '${_i}appstore.svg',
        ),
      ],
      stack: <String>['Flutter', 'Node.js'],
      highlights: <String>[
        'Built a cybercrime reporting platform that lets users flag '
            'phishing emails, scan URLs and domains, and monitor breached emails '
            'and phone numbers.',
        'Added real-time threat sharing and community discussion so users learn '
            'from reported scams rather than generic guidance alone.',
        'Designed for accessibility, extending protection to seniors and '
            'underserved users unfamiliar with security practices.',
      ],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFF00468C), Color(0xFF56C8D6)],
      ),
    ),
    Project(
      name: 'OceanicView',
      tagline:
          'Marketplace with distinct Seller and Customer interfaces, live chat '
          'and social login.',
      image: 'assets/images/projects/oceanicview/oceanicview.png',
      status: ProjectStatus.launchingSoon,
      links: <ProjectLink>[
        ProjectLink(
          label: 'Play',
          iconPath: '${_i}google_play.svg',
          pendingMessage: 'Live soon',
        ),
      ],
      stack: <String>[
        'Flutter',
        'Firebase',
        'BLoC',
        'WebSocket',
        'Stripe',
        'MVVM',
      ],
      highlights: <String>[
        'Built an e-commerce marketplace as sole developer with distinct Seller '
            'and Customer interfaces across iOS and Android.',
        'Implemented live chat over WebSocket, plus Google, Apple and Facebook '
            'sign-in with secured authentication and authorization.',
        'Integrated Stripe payments, Dio APIs, offline caching, location '
            'services, FCM notifications and full in-app localization.',
        'Managed state with BLoC and Equatable on an MVVM + Clean Architecture '
            'foundation.',
      ],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFFA57E29), Color(0xFFFFE09D)],
      ),
    ),
    Project(
      name: 'ThrillPay',
      tagline:
          'Digital wallet evolved into a QR-payment marketplace with vendor '
          'deals and rewards.',
      image: 'assets/images/projects/thrillpay/feature-banner.png',
      status: ProjectStatus.live,
      metric: 'Live product',
      links: <ProjectLink>[
        ProjectLink(label: 'Live product', url: 'https://app.thrillpay.com/'),
      ],
      stack: <String>[
        'Flutter',
        'Node.js',
        'MySQL',
        'MVVM',
        'Stripe',
        'Dio',
      ],
      highlights: <String>[
        'Built the ThrillPay wallet end to end as sole developer — Flutter '
            'client, Node.js/Express and MySQL backend on MVVM.',
        'Shipped QR-powered checkout alongside a vendor marketplace, flash deals '
            'and cashback rewards, with AI-powered vendor recommendations and '
            'approval pipelines.',
        'Integrated Stripe, Google and Facebook sign-in, multi-currency '
            'selection, offline API caching and Crashlytics crash reporting.',
      ],
      gradient: LinearGradient(
        colors: <Color>[
          Color(0xFFF3701B),
          Color(0xFFF80A60),
          Color(0xFFA216DC),
        ],
      ),
    ),
    Project(
      name: 'Pelican State Treating',
      tagline:
          'Mobile glycol pump calculator built for a gas treating services '
          'operator.',
      image: 'assets/images/projects/pelican/pelican.jpg',
      status: ProjectStatus.privateClient,
      stack: <String>[
        'Flutter',
        'Node.js',
        'MongoDB',
        'Clean Architecture',
        'Unit Testing'
      ],
      highlights: <String>[
        'Built a mobile Glycol Pump Calculator for Pelican State Treating’s '
            'field technicians, extending the company’s browser-based tool into '
            'the field.',
        'Developed the Flutter front end and Node.js backend end to end as sole '
            'developer.',
        'Delivered as private client work for a gas treating services operator '
            'serving the Haynesville, Permian and Marcellus basins.',
      ],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFF2C5533), Color(0xFF4E8A5C)],
      ),
    ),
    Project(
      name: 'SAFAR (AI Travel Companion)',
      tagline:
          'Multi-agent travel platform coordinating planning, booking and group '
          'expenses.',
      image: 'assets/images/projects/aitravel/safar.png',
      status: ProjectStatus.inDevelopment,
      stack: <String>[
        'Flutter',
        'Node.js',
        'MongoDB',
        'LangGraph',
        'LangChain',
        'LangSmith',
        'Stripe',
        'WebSocket',
      ],
      highlights: <String>[
        'Built a multi-agent travel platform where LangGraph agents coordinate '
            'trip planning, itineraries, flights, hotels, dining and transport '
            'in a single conversation.',
        'Implemented group chat, persistent trip state, social sharing, expense '
            'splitting and friend-to-friend Stripe payments.',
        'Traced every agent run in LangSmith for evaluation and observability.',
      ],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFF6A2C8F), Color(0xFFB14BC4)],
      ),
    ),
    Project(
      name: 'InterviewAI',
      tagline: 'Stateful AI interviewer with adaptive questioning and parallel '
          'evaluation agents.',
      image: 'assets/images/projects/interviewai/aiinterview.png',
      status: ProjectStatus.inDevelopment,
      stack: <String>[
        'LangGraph',
        'LangChain',
        'LangSmith',
        'RAG',
        'FastAPI',
        'PostgreSQL',
      ],
      highlights: <String>[
        'Built a stateful AI interviewer grounded in a candidate’s resume and '
            'job description, with adaptive questioning and checkpointed '
            'LangGraph workflows.',
        'Ran parallel evaluation agents to produce evidence-backed assessments '
            'with recruiter-ready reporting, traced end-to-end in LangSmith.',
        'Delivered real-time voice interviews over WebSocket with streaming '
            'STT/TTS on a FastAPI and PostgreSQL backend.',
      ],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFF134E4A), Color(0xFF2F8F83)],
      ),
    ),
    Project(
      name: 'Funotel',
      tagline:
          'Travel platform built end to end, including a native media pipeline.',
      image: 'assets/images/projects/funotel/funotel.png',
      portraitImage: true,
      status: ProjectStatus.inDevelopment,
      stack: <String>[
        'Flutter',
        'Node.js',
        'MongoDB',
        'FFmpeg',
        'Flutter Platform Channels',
        'Paytm'
      ],
      highlights: <String>[
        'Built a travel platform end to end as sole developer, spanning a '
            'Flutter client and a Node.js with MongoDB backend.',
        'Replaced a third-party FFmpeg package with a custom native '
            'implementation through Flutter Platform Channels, removing an '
            'external dependency and taking direct control of media processing.',
        'Handled API validation and secure client-server communication across '
            'the stack.',
      ],
      gradient: LinearGradient(
        colors: <Color>[Color(0xFF1F6F8B), Color(0xFF52A7BD)],
      ),
    ),
  ];

  static const List<SkillGroup> softSkills = <SkillGroup>[
    SkillGroup(
      title: 'Client & Stakeholder Communication',
      skills: <Skill>[
        Skill(name: 'Client-facing communication'),
        Skill(name: 'Requirements gathering'),
        Skill(name: 'Product and feature walkthroughs'),
        Skill(name: 'Explaining technical work to non-technical stakeholders'),
      ],
    ),
    SkillGroup(
      title: 'Business & Product Understanding',
      skills: <Skill>[
        Skill(name: 'Client business model analysis'),
        Skill(name: 'Product and business input'),
        Skill(name: 'Freelance project scoping'),
      ],
    ),
  ];

  static const List<Stat> stats = <Stat>[
    Stat(value: Profile.years, label: 'Years experience'),
    Stat(value: '11', label: 'Production apps'),
    Stat(value: '61%', label: 'App size reduced'),
    Stat(value: '40%', label: 'API latency cut'),
  ];
}
