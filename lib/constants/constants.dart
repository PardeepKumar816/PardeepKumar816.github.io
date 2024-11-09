import 'package:flutter/material.dart';

final routes = ['Home', 'About', 'Tech', 'Projects', 'Contact'];

final Map<String, String> aboutData = {
  "bio":
      "I am a Software Engineer at Eplanet Global, where I design, develop, and deploy cross-platform apps for Android and iOS using Flutter and Dart. Previously, I worked remotely as a Flutter developer at Aditya Enterprises for 2 years, where I contributed to the development of various applications across different domains. Prior to these roles, I completed two internships that helped me build a strong foundation in software development. I am proficient in Java, JavaScript, and Node.js. I have successfully completed my Software Engineering degree at Mehran University of Engineering and Technology, maintaining high academic performance. I am passionate about learning new technologies and improving my skills. My goal is to become a successful and innovative full stack mobile application developer.",
  "quote":
      '“Success is built on continuous learning, innovation, and the courage to turn challenges into opportunities.”',
  "greeting": "Hello there! My name is Pardeep Kumar"
};

class Constants {
  static ScrollController? controller;
}

class GlobalContext {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext? get currentContext => navigatorKey.currentContext;

  static NavigatorState? get currentState => navigatorKey.currentState;
  static final GlobalKey<ScaffoldState> globalScaffoldKey = GlobalKey();
}
