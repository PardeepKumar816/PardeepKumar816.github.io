import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:protfolio/sections/contact/contact_mobile.dart';
import 'package:protfolio/utils/my_colors.dart';

class ContactTablet extends StatelessWidget {
  const ContactTablet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff232129),
        body: Container(
          decoration: const BoxDecoration(
            gradient: MyColors.linearGradientDark,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              CarouselSlider(
                items: List.generate(
                  3,
                  (i) {
                    return Container(
                      width: 400,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        color: const Color(0xff282829),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            contactData.values.toList()[i]["icon"],
                            color: Colors.white,
                            size: 60,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            contactData.keys.toList()[i],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            contactData.values.toList()[i]["text"],
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  height: 300,
                  autoPlay: true,
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Developed in ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.h,
                    ),
                  ),
                  const Icon(
                    FontAwesomeIcons.solidHeart,
                    color: Colors.blueAccent,
                  ),
                  Text(
                    " with ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.h,
                    ),
                  ),
                  Text(
                    "Flutter",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.h,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
            ],
          ),
        ));
  }
}
