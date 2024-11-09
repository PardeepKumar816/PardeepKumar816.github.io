import 'package:flutter/material.dart';
import 'package:protfolio/responsive/responsive.dart';
import 'package:protfolio/sections/home/home_desktop.dart';
import 'home_mobile.dart';
import 'home_tablet.dart';

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: HomeDesktop(),
      tablet: HomeTablet(),
      mobile: HomeMobile(),
    );
  }
}
