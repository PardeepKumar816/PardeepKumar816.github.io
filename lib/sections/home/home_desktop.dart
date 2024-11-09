import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protfolio/constants/constants.dart';
import 'package:protfolio/utils/device_size.dart';
import 'package:protfolio/utils/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/multi_line_text_container.dart';
import '../../widgets/social_container.dart';

class HomeDesktop extends StatelessWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff232129),
        body: Builder(builder: (context) {
          return Container(
            decoration:
                const BoxDecoration(gradient: MyColors.linearGradientDark),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: getDeviceSize(context).width * 0.01,
                  ),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        launchUrl(
                          Uri.parse("https://github.com/PardeepKumar816"),
                        );
                      },
                      child: Container(
                        width: getDeviceSize(context).width * 0.06,
                        height: getDeviceSize(context).width * 0.06,
                        decoration: const BoxDecoration(
                          gradient: MyColors.linearGradient,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          "assets/logo/github-black.png",
                          width: getDeviceSize(context).width * 0.01,
                          height: getDeviceSize(context).width * 0.01,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
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
                                borderRadius: BorderRadius.all(
                                  Radius.circular(4),
                                ),
                              ),
                              child: const Text(
                                "Full Stack Flutter Expert",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Pardeep",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 64),
                            ),
                            Text(
                              "Kumar",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w200,
                                    color: Colors.white.withOpacity(0.8),
                                    letterSpacing: 10,
                                    height: 1.0,
                                    fontFamily: 'Montserrat',
                                    fontSize: 64,
                                  ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.play_arrow,
                                  color: MyColors.yellowE3812A,
                                  size: getDeviceSize(context).width * 0.02,
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
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      getDeviceSize(context).width * 0.01),
                              child: Row(
                                children: [
                                  Container(
                                    width: getDeviceSize(context).width * 0.05,
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
                                  top: getDeviceSize(context).width * 0.015),
                              child: Row(
                                children: [
                                  const MultilineTextContainer(
                                    text1: "3",
                                    text2: "Years",
                                    text3: "Experience",
                                  ),
                                  SizedBox(
                                    width: getDeviceSize(context).width * 0.02,
                                  ),
                                  const MultilineTextContainer(
                                    text1: "10",
                                    text2: "Projects Completed",
                                    text3: "Locally & Internationally",
                                  ),
                                  // SizedBox(
                                  //   width: getDeviceSize(context).width * 0.02,
                                  // ),
                                  // const MultilineTextContainer(
                                  //   text1: "10",
                                  //   text2: "Projects Completed",
                                  //   text3: "Locally & Internationally",
                                  // ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Container(
                              // width: getDeviceSize(context).width * 0.8,
                              // height: getDeviceSize(context).height * 0.8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: const Color(0xffB96220).withOpacity(0.1),
                              ),
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  "assets/images/pardeep.png",
                                  width: getDeviceSize(context).width * 0.35,
                                  height: getDeviceSize(context).width * 0.35,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}

class HomeBar extends StatelessWidget {
  const HomeBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: getDeviceSize(context).width * 0.1,
          right: getDeviceSize(context).width * 0.05,
          top: getDeviceSize(context).width * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Text(
                "< ",
                style: TextStyle(
                  fontSize: 20,
                  color: MyColors.yellowE3812A,
                ),
              ),
              Text(
                "Pardeep",
                style: TextStyle(
                  fontFamily: 'Agustina',
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: MyColors.yellowE3812A,
                ),
              ),
              Text(
                " >",
                style: TextStyle(
                  fontSize: 20,
                  color: MyColors.yellowE3812A,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 64),
            child: Row(
              children: [
                TextButton(
                    onPressed: () {
                      Constants.controller!.animateTo(
                        0,
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      "Home",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        color: MyColors.yellowE3812A,
                      ),
                    )),
                const SizedBox(width: 32),
                TextButton(
                    onPressed: () {
                      Constants.controller!.animateTo(
                        1.sh,
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      "About",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        color: MyColors.yellowE3812A,
                      ),
                    )),
                const SizedBox(width: 32),
                TextButton(
                    onPressed: () {
                      Constants.controller!.animateTo(
                        2.sh,
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      "Tech",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        color: MyColors.yellowE3812A,
                      ),
                    )),
                const SizedBox(width: 32),
                // SizedBox(
                //   width: getDeviceSize(context).width * 0.1,
                // ),
                TextButton(
                    onPressed: () {
                      Constants.controller!.animateTo(
                        3.sh,
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      "Projects",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        color: MyColors.yellowE3812A,
                      ),
                    )),
                const SizedBox(width: 32),
                // SizedBox(
                //   width: getDeviceSize(context).width * 0.1,
                // ),
                TextButton(
                    onPressed: () {
                      Constants.controller!.animateTo(
                        4.sh,
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: const Text(
                      "Experience",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        color: MyColors.yellowE3812A,
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
