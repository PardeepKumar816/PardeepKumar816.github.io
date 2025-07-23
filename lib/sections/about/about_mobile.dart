import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:protfolio/utils/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/constants.dart';
import '../../utils/device_size.dart';

class AboutMobile extends StatelessWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232129),
      body: Container(
        decoration: const BoxDecoration(gradient: MyColors.linearGradientDark),
        child: Padding(
          padding: getDeviceSize(context).width < 330
              ? const EdgeInsets.symmetric(vertical: 10, horizontal: 10)
              : EdgeInsets.symmetric(
                  vertical: 24, horizontal: getDeviceSize(context).width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "About Me",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: MyColors.yellowE3812A,
                    fontWeight: FontWeight.bold,
                    fontSize: getDeviceSize(context).width < 420 ? 18 : 18),
              ),
              SizedBox(
                height: getDeviceSize(context).width < 420 ? 12 : 24,
              ),
              Text(aboutData["greeting"]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: getDeviceSize(context).width < 420 ? 15 : 24)),
              SizedBox(
                height: getDeviceSize(context).width < 420 ? 12 : 24,
              ),
              Text(
                aboutData["quote"]!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: getDeviceSize(context).width < 420
                    ? getDeviceSize(context).width * 0.01
                    : getDeviceSize(context).width * 0.02,
              ),
              AnimatedTextKit(
                isRepeatingAnimation: false,
                repeatForever: false,
                totalRepeatCount: 1,
                animatedTexts: [
                  TyperAnimatedText(
                    aboutData["bio"]!,
                    textStyle: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                    speed: const Duration(
                        milliseconds: 10), // slower for long text
                  ),
                ],
              ),
              // Text(
              //   aboutData["bio"]!,
              //   textAlign: TextAlign.center,
              //   style: const TextStyle(
              //       fontFamily: 'Montserrat',
              //       color: Colors.white,
              //       fontWeight: FontWeight.w600,
              //       fontSize: 12,
              //       letterSpacing: 1),
              // ),
              SizedBox(
                height: getDeviceSize(context).width < 420
                    ? getDeviceSize(context).width * 0.01
                    : getDeviceSize(context).width * 0.02,
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(
                      "https://drive.google.com/file/d/1mvm-9p8FUSK_EcU-_e-umFFp1IMMISyi/view?usp=sharing"));
                },
                child: Container(
                  width: 220,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    gradient: MyColors.linearGradient2,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.file_present_sharp,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Download Resume",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
