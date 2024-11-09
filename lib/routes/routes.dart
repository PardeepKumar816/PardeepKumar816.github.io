import 'package:protfolio/sections/contact/contact.dart';
import 'package:protfolio/sections/home/home.dart';
import 'package:protfolio/sections/main/main_section.dart';
import 'package:protfolio/sections/projects/projects.dart';
import 'package:protfolio/sections/tech/tech.dart';

import '../sections/about/about.dart';

class Routes {
  static String home = '/Home';
  static String about = '/About';
  static String mainSection = '/MainSection';
  static String tech = '/Tech';
  static String projects = '/Projects';
  static String contact = '/Contact';

  static getRoutes(context) {
    return {
      Routes.home: (context) => const Home(),
      Routes.about: (context) => const About(),
      Routes.mainSection: (context) => const MainPage(),
      Routes.tech: (context) => const Tech(),
      Routes.projects: (context) => const Projects(),
      Routes.contact: (context) => const Contact()
    };
  }
}
