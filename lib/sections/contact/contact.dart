import 'package:flutter/material.dart';
import 'package:protfolio/responsive/responsive.dart';
import 'package:protfolio/sections/contact/contact_desktop.dart';
import 'package:protfolio/sections/contact/contact_mobile.dart';
import 'package:protfolio/sections/contact/contact_tablet.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      desktop: ContactDesktop(),
      tablet: ContactTablet(),
      mobile: ContactMobile(),
    );
  }
}
