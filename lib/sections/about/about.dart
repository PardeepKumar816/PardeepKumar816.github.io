

import 'package:flutter/material.dart';
import 'package:protfolio/sections/about/about_desktop.dart';
import 'package:protfolio/sections/about/about_mobile.dart';
import '../../responsive/responsive.dart';
import 'about_tablet.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(desktop: AboutDesktop(),tablet: AboutTablet(),mobile: AboutMobile(),);
  }
}
