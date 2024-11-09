import 'package:flutter/material.dart';
import 'package:protfolio/responsive/responsive.dart';
import 'package:protfolio/sections/tech/tech_desktop.dart';
import 'package:protfolio/sections/tech/tech_mobile.dart';
import 'package:protfolio/sections/tech/tech_tablet.dart';


class Tech extends StatelessWidget {
  const Tech({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(desktop: TechDesktop(),tablet: TechTablet(),mobile: TechMobile(),);
  }
}
