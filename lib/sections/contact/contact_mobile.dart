import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:protfolio/utils/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMobile extends StatelessWidget {
  const ContactMobile({super.key});

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
                    return InkWell(
                      onTap: () {
                        if (contactData.keys.toList()[i] == "Email") {
                          final Uri emailLaunchUri = Uri(
                            scheme: 'mailto',
                            path: contactData.values.toList()[i]["text"],
                          );
                          launchUrl(emailLaunchUri);
                        }
                        if (contactData.keys.toList()[i] == "Phone") {
                          final Uri phoneLaunchUri = Uri(
                            scheme: 'tel',
                            path: contactData.values.toList()[i]["text"],
                          );
                          launchUrl(phoneLaunchUri);
                        }
                      },
                      child: Container(
                        width: 1.sw * 0.8,
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
                              size: 60.w,
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            Text(
                              contactData.keys.toList()[i],
                              style: TextStyle(
                                fontSize: 18.h,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              contactData.values.toList()[i]["text"],
                              style: TextStyle(
                                fontSize: 13.h,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                options: CarouselOptions(enlargeCenterPage: true),
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

final Map<String, dynamic> contactData = {
  "Email": {"icon": Icons.email, "text": "pardeepmalhi816@gmail.com"},
  "Phone": {"icon": Icons.phone, "text": "(+92) 3353146121"},
  "Location": {"icon": Icons.location_on, "text": "Karachi, Pakistan"},
};
