import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protfolio/responsive/responsive.dart';
import 'package:protfolio/utils/device_size.dart';
import 'package:protfolio/utils/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/multi_line_text_container.dart';
import '../../widgets/social_container.dart';

class HomeMobile extends StatelessWidget {
  const HomeMobile({Key? key}) : super(key: key);

  double getConstraints(context) {
    if (getDeviceSize(context).height > 750 &&
        getDeviceSize(context).height < 852) {
      return getDeviceSize(context).width * 0.7;
    } else if (getDeviceSize(context).height > 852 &&
        getDeviceSize(context).height < 950) {
      return getDeviceSize(context).width * 0.8;
    } else {
      return getDeviceSize(context).width * 0.7;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232129),
      body: Container(
        decoration: const BoxDecoration(gradient: MyColors.linearGradientDark),
        child: Builder(
          builder: (context) {
            return Stack(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: getDeviceSize(context).width * 0.1),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 220,
                            height: 32,
                            decoration: const BoxDecoration(
                                gradient: MyColors.linearGradient2,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: const Text(
                              "Full Stack Flutter Expert",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            "Pardeep",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontFamily: 'Montserrat',
                              fontSize:
                                  getDeviceSize(context).width < 302 ? 48 : 64,
                            ),
                          ),
                          Text(
                            "Kumar",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              color: Colors.white.withOpacity(0.8),
                              letterSpacing: 10,
                              height: 1.0,
                              fontFamily: 'Montserrat',
                              fontSize:
                                  getDeviceSize(context).width < 302 ? 48 : 64,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: MyColors.yellowE3812A,
                                size: isMobile()
                                    ? 12.h
                                    : getDeviceSize(context).width * 0.02,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              AnimatedTextKit(
                                animatedTexts: [
                                  TyperAnimatedText(
                                    'Student,',
                                    textStyle: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: Colors.white,
                                    ),
                                  ),
                                  TyperAnimatedText(
                                    'Software Engineer,',
                                    textStyle: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TyperAnimatedText(
                                    'Flutter Developer,',
                                    textStyle: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TyperAnimatedText(
                                    'Node.js Developer,',
                                    textStyle: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TyperAnimatedText(
                                    'Core Java Developer,',
                                    textStyle: const TextStyle(
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              children: [
                                Container(
                                  width: getDeviceSize(context).width * 0.1,
                                  height: 1,
                                  decoration: const BoxDecoration(
                                    color: MyColors.yellowE3812A,
                                  ),
                                ),
                                SizedBox(
                                  width: getDeviceSize(context).width * 0.01,
                                ),
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                      Uri.parse(
                                          "https://www.linkedin.com/in/pardeep-kumar-a257221a1/"),
                                    );
                                  },
                                  child: const SocialContainer(
                                    link: "assets/logo/linkedin.png",
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                      Uri.parse(
                                          "https://github.com/PardeepKumar816"),
                                    );
                                  },
                                  child: const SocialContainer(
                                    link: "assets/logo/github.png",
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                      Uri.parse(
                                          "https://www.instagram.com/pardeep_hotwani/"),
                                    );
                                  },
                                  child: const SocialContainer(
                                    link: "assets/logo/instagram.png",
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                      Uri.parse(
                                          "https://twitter.com/Pardeepm006"),
                                    );
                                  },
                                  child: const SocialContainer(
                                    link: "assets/logo/twitter.png",
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    launchUrl(
                                      Uri.parse(
                                          "https://www.facebook.com/Pardeepmalhi816/"),
                                    );
                                  },
                                  child: const SocialContainer(
                                    link: "assets/logo/facebook.png",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launchUrl(
                                Uri.parse("https://wa.me/923353146121"),
                              );
                            },
                            child: Column(
                              children: [
                                const Text(
                                  "LET'S CHAT!",
                                  style: TextStyle(
                                      color: MyColors.yellowE3812A,
                                      height: 2.0,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'Montserrat',
                                      letterSpacing: 2),
                                ),
                                Container(
                                  width: 104,
                                  height: 1,
                                  decoration: const BoxDecoration(
                                    color: MyColors.yellowE3812A,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: getDeviceSize(context).width * 0.01,
                                  top: getDeviceSize(context).width * 0.04),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const MultilineTextContainer(
                                        text1: "3",
                                        text2: "Years",
                                        text3: "Experience",
                                      ),
                                      SizedBox(
                                        height:
                                            getDeviceSize(context).width * 0.02,
                                      ),
                                      const MultilineTextContainer(
                                        text1: "10",
                                        text2: "Projects Completed",
                                        text3: "Locally & Internationally",
                                      ),
                                      // SizedBox(
                                      //   height:
                                      //       getDeviceSize(context).width * 0.02,
                                      // ),
                                      // const MultilineTextContainer(
                                      //   text1: "10",
                                      //   text2: "Projects Completed",
                                      //   text3: "Locally & Internationally",
                                      // ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ),
                    ),
                  ],
                ),
                getDeviceSize(context).height > 750
                    ? Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: Image.asset(
                          "assets/images/pardeep.png",
                          width: getConstraints(context),
                          height: getConstraints(context),
                        ),
                      )
                    : Positioned(
                        bottom: 0,
                        right: 0,
                        child: Image.asset(
                          "assets/images/pardeep.png",
                          width: getDeviceSize(context).width * 0.5,
                          height: getDeviceSize(context).width * 0.5,
                        ),
                      ),
              ],
            );
          },
        ),
      ),
    );
  }
}
