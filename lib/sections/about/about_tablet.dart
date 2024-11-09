import 'package:flutter/material.dart';
import 'package:protfolio/utils/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../constants/constants.dart';
import '../../utils/device_size.dart';

class AboutTablet extends StatelessWidget {
  const AboutTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232129),
      body: Container(
        decoration: const BoxDecoration(gradient: MyColors.linearGradientDark),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: getDeviceSize(context).width < 660 ? 24 : 48,
              horizontal: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "About Me",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: MyColors.yellowE3812A,
                  fontWeight: FontWeight.bold,
                  fontSize: getDeviceSize(context).width < 815 ? 18 : 22,
                ),
              ),
              SizedBox(height: getDeviceSize(context).width < 815 ? 30 : 20),
              Text(
                aboutData["greeting"]!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.w300,
                  fontSize: getDeviceSize(context).width < 815 ? 32 : 40,
                ),
              ),
              SizedBox(height: getDeviceSize(context).width < 815 ? 30 : 20),
              Text(
                aboutData["quote"]!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                  height: getDeviceSize(context).width < 815
                      ? getDeviceSize(context).width * 0.02
                      : getDeviceSize(context).width * 0.02),
              Text(
                aboutData["bio"]!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: getDeviceSize(context).width < 815 ? 12 : 16,
                    letterSpacing: 1),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(
                      "https://drive.google.com/file/d/1lvCBqGTFv81oQn9_R8VHunss9-3U3r3h/view?usp=sharing"));
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
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
