import 'package:flutter/material.dart';
import 'package:protfolio/responsive/responsive.dart';
import 'package:protfolio/sections/projects/projects_desktop.dart';
import 'package:protfolio/sections/projects/projects_mobile.dart';
import 'package:protfolio/sections/projects/projects_tablet.dart';


class Projects extends StatelessWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(desktop: ProjectsDesktop(),tablet: ProjectsTablet(),mobile: ProjectsMobile(),);
  }
}