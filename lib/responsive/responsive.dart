import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Responsive extends StatelessWidget {
  final Widget? desktop;
  final Widget? tablet;
  final Widget? mobile;
  const Responsive({Key? key, this.desktop, this.mobile, this.tablet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1000) {
        return desktop!;
      } else if (constraints.maxWidth >= 600) {
        return tablet!;
      } else {
        return mobile!;
      }
    });
  }
}

bool isMobile() => 1.sw < 600;
bool isTablet() => 1.sw >= 600 && 1.sw < 1000;
bool isDesktop() => 1.sw >= 1000;
