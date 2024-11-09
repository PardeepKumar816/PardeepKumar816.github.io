import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protfolio/sections/projects/projects_desktop.dart';
import 'package:protfolio/utils/my_colors.dart';

class ProjectsTablet extends StatelessWidget {
  const ProjectsTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232129),
      body: Container(
        decoration: const BoxDecoration(
          gradient: MyColors.linearGradientDark,
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 64,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Text(
                  "Projects",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: MyColors.yellowE3812A,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.h,
                  ),
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 24.w),
                child: Text(
                  "Stuf I'm in loved working with",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14.h),
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              CarouselSlider(
                items: List.generate(projects.length, (i) {
                  return ProjectCard(
                    project: projects[i],
                  );
                }),
                options: CarouselOptions(
                  autoPlay: true,
                  height: 400.h,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
