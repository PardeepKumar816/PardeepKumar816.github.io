import 'package:flutter/material.dart';
import 'package:protfolio/constants/constants.dart';
import 'package:protfolio/utils/device_size.dart';
import 'package:protfolio/utils/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDesktop extends StatelessWidget {
  const AboutDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232129),
      body: Container(
        decoration: const BoxDecoration(gradient: MyColors.linearGradientDark),
        child: Padding(
          padding: EdgeInsets.symmetric(
            // horizontal: getDeviceSize(context).width < 1135
            //     ? getDeviceSize(context).width * 0.03
            //     : getDeviceSize(context).width * 0.06,
            vertical: 48,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Image.asset(
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitHeight,
                  "assets/images/pardeep.png",
                ),
                // Container(
                //   alignment: Alignment.topCenter,
                //   decoration: const BoxDecoration(
                //     // image: DecorationImage(
                //     //   fit: BoxFit.contain,
                //     //   alignment: Alignment.topCenter,
                //     //   image: AssetImage(
                //     //     "assets/images/self_image.png",
                //     //   ),
                //     // ),
                //     //  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                //     color: Colors.amber,
                //   ),
                //   child: Image.asset(
                //     alignment: Alignment.topCenter,
                //     fit: BoxFit.none,
                //     "assets/images/self_image.png",
                //   ),
                // ),
              ),
              SizedBox(
                width: getDeviceSize(context).width < 1135
                    ? getDeviceSize(context).width * 0.02
                    : getDeviceSize(context).width * 0.04,
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  // width: getDeviceSize(context).width*0.43,
                  //   height: getDeviceSize(context).height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About Me",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: MyColors.yellowE3812A,
                          fontWeight: FontWeight.bold,
                          fontSize:
                              getDeviceSize(context).width > 1340 ? 22 : 16,
                        ),
                      ),
                      getDeviceSize(context).width > 1340
                          ? const SizedBox(height: 24)
                          : const SizedBox(height: 18),
                      Text(
                        aboutData["greeting"]!,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontSize:
                              getDeviceSize(context).width > 1340 ? 40 : 32,
                        ),
                      ),
                      getDeviceSize(context).width > 1340
                          ? const SizedBox(height: 24)
                          : const SizedBox(height: 18),
                      Text(
                        aboutData["quote"]!,
                        style: const TextStyle(
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                      //  SizedBox(height: getDeviceSize(context).width*0.02,),
                      getDeviceSize(context).width > 1340
                          ? const SizedBox(height: 24)
                          : const SizedBox(height: 18),
                      Padding(
                        padding: EdgeInsets.only(
                            right:
                                getDeviceSize(context).width > 1390 ? 60 : 20),
                        child: Text(
                          aboutData["bio"]!,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize:
                                getDeviceSize(context).width > 1340 ? 16 : 15,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                      // getDeviceSize(context).width > 1340
                      //     ? const SizedBox(height: 24)
                      //     : const SizedBox(height: 18),
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
            ],
          ),
        ),
      ),
    );
  }
}
