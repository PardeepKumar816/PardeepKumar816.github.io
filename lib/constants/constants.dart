import 'package:flutter/material.dart';

final routes = ['Home', 'About', 'Tech', 'Projects', 'Contact'];

final Map<String, String> aboutData = {
  "bio":
      "As a Software Engineer, I bridge the gap between seamless user experiences and robust backend architecture. Holding a degree in Software Engineering from Mehran University , I've spent the last 4+ years turning complex requirements into scalable applications.In my current role at EPlanet Global , I was recognized as Employee of the Quarter for taking full ownership of multiple projects and shipping them to production. My technical toolkit centers around Flutter, Dart, Node.js, and JavaScript, but I am always expanding my capabilities. Currently, I am designing advanced AI workflows using LangChain, LangGraph, and LangSmith, and engineering bespoke backend solutions, such as dynamic multi-location artist data retrieval systems. Having previously spent two years working remotely to build modular, cross-platform applications, I am highly effective in distributed environments and ready to tackle new challenges worldwide.",
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
