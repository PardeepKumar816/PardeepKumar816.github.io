import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:protfolio/constants/constants.dart';
import 'package:protfolio/utils/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      backgroundColor: Colors.black,
      child: Container(
        decoration: const BoxDecoration(gradient: MyColors.linearGradientDark),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  child: const Icon(
                    Icons.clear,
                    color: MyColors.orangeC8171E,
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              const Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: MyColors.yellowE3812A.withOpacity(0.3),
              ),
              const SizedBox(
                height: 24,
              ),
              DrawerIconButton(
                onTap: () {
                  Navigator.pop(context);
                  Constants.controller!.animateTo(
                    0,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                text: "HOME",
                icon: FontAwesomeIcons.home,
              ),
              const SizedBox(
                height: 24,
              ),
              DrawerIconButton(
                onTap: () {
                  Navigator.pop(context);
                  Constants.controller!.animateTo(
                    1.sh,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                text: "ABOUT",
                icon: FontAwesomeIcons.userLarge,
              ),
              const SizedBox(
                height: 24,
              ),
              DrawerIconButton(
                onTap: () {
                  Navigator.pop(context);
                  Constants.controller!.animateTo(
                    2.sh,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                text: "SERVICES",
                icon: FontAwesomeIcons.toolbox,
              ),
              const SizedBox(
                height: 24,
              ),
              DrawerIconButton(
                onTap: () {
                  Navigator.pop(context);
                  Constants.controller!.animateTo(
                    3.sh,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                text: "PROJECTS",
                icon: FontAwesomeIcons.gear,
              ),
              const SizedBox(
                height: 24,
              ),
              DrawerIconButton(
                onTap: () {
                  Navigator.pop(context);
                  Constants.controller!.animateTo(
                    4.sh,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                },
                text: "CONTACT",
                icon: FontAwesomeIcons.solidContactCard,
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () {
                  launchUrl(Uri.parse(
                      "https://drive.google.com/file/d/1mvm-9p8FUSK_EcU-_e-umFFp1IMMISyi/view?usp=sharing"));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: const Color(0xffB96220),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Icon(
                        FontAwesomeIcons.filePdf,
                        color: MyColors.yellowE3812A.withOpacity(0.8),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      const Text(
                        "RESUME",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
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

class DrawerIconButton extends StatelessWidget {
  const DrawerIconButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  final String text;
  final IconData icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 16,
          ),
          Icon(
            icon,
            color: MyColors.yellowE3812A.withOpacity(0.8),
          ),
          const SizedBox(
            width: 24,
          ),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
