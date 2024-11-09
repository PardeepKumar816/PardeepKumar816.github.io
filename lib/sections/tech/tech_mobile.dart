import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:protfolio/utils/device_size.dart';
import 'package:protfolio/utils/my_colors.dart';

class TechMobile extends StatelessWidget {
  const TechMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232129),
      body: Container(
        decoration: const BoxDecoration(gradient: MyColors.linearGradientDark),
        child: Padding(
          padding: EdgeInsets.only(left: getDeviceSize(context).width / 9),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Text(
                "Tech Stack",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: MyColors.yellowE3812A,
                  fontWeight: FontWeight.w700,
                  fontSize: getDeviceSize(context).width < 506 ? 18 : 22,
                ),
              ),
              SizedBox(
                height: getDeviceSize(context).width < 506 ? 8 : 16,
              ),
              Text(
                """Growth happens when curiosity meets action. I dive into new technologies, 
simplify the complex, 
and turn ideas into meaningful solutions that push boundaries :)""",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: getDeviceSize(context).width < 506 ? 10 : 12,
                ),
              ),
              SizedBox(
                height: getDeviceSize(context).width < 506 ? 8 : 16,
              ),
              const SkillName(
                skillName: "Mobile development",
              ),
              SizedBox(
                height: getDeviceSize(context).width < 506 ? 8 : 16,
              ),
              const Row(
                children: [
                  SkillContainer(
                    asset: "assets/icons/flutter.svg",
                    skill: "Flutter",
                  ),
                  // SizedBox(
                  //   width: 12,
                  // ),
                  // SkillContainer(
                  //   asset: "assets/icons/dart.svg",
                  //   skill: "Dart",
                  // ),
                  SizedBox(
                    width: 12,
                  ),
                  SkillContainer(
                    asset: "assets/icons/android.svg",
                    skill: "Android",
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  SkillContainer(
                    asset: "assets/icons/apple.svg",
                    skill: "IOS",
                  ),
                ],
              ),
              SizedBox(
                height: getDeviceSize(context).width < 506 ? 8 : 16,
              ),
              const SkillName(
                skillName: "Web development",
              ),
              SizedBox(
                height: getDeviceSize(context).width < 506 ? 8 : 16,
              ),
              Column(
                children: [
                  if (getDeviceSize(context).width > 506)
                    const Row(
                      children: [
                        SkillContainer(
                          asset: "assets/icons/html.svg",
                          skill: "HTML 5",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SkillContainer(
                          asset: "assets/icons/css.svg",
                          skill: "CSS 3",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SkillContainer(
                          asset: "assets/icons/bootstrap.svg",
                          skill: "Bootstrap",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SkillContainer(
                          asset: "assets/icons/js.svg",
                          skill: "Javascript",
                        ),
                      ],
                    ),
                  if (getDeviceSize(context).width < 506) ...[
                    const Row(
                      children: [
                        SkillContainer(
                          asset: "assets/icons/html.svg",
                          skill: "HTML 5",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SkillContainer(
                          asset: "assets/icons/css.svg",
                          skill: "CSS 3",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Row(
                      children: [
                        SkillContainer(
                          asset: "assets/icons/bootstrap.svg",
                          skill: "Bootstrap",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SkillContainer(
                          asset: "assets/icons/js.svg",
                          skill: "Javascript",
                        ),
                      ],
                    )
                  ]
                ],
              ),
              SizedBox(
                height: getDeviceSize(context).width < 506 ? 8 : 16,
              ),
              const SkillName(
                skillName: "Server Side",
              ),
              SizedBox(
                height: getDeviceSize(context).width < 506 ? 8 : 16,
              ),
              Column(
                children: [
                  if (getDeviceSize(context).width > 506)
                    const Row(
                      children: [
                        SkillContainer(
                          asset: "assets/icons/node.svg",
                          skill: "Node.js",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SkillContainer(
                          asset: "assets/icons/express.svg",
                          skill: "Express.js",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SkillContainer(
                          asset: "assets/icons/api.svg",
                          skill: "REST APIs",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SkillContainer(
                          asset: "assets/icons/dart_frog.svg",
                          skill: "Dart Frog",
                        ),
                      ],
                    ),
                  if (getDeviceSize(context).width < 506) ...[
                    const Row(
                      children: [
                        SkillContainer(
                          asset: "assets/icons/node.svg",
                          skill: "Node.js",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SkillContainer(
                          asset: "assets/icons/express.svg",
                          skill: "Express.js",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Row(
                      children: [
                        SkillContainer(
                          asset: "assets/icons/api.svg",
                          skill: "REST APIs",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SkillContainer(
                          asset: "assets/icons/dart_frog.svg",
                          skill: "Dart Frog",
                        ),
                      ],
                    )
                  ]
                ],
              ),
              SizedBox(
                height: getDeviceSize(context).width < 506 ? 8 : 16,
              ),
              const SkillName(
                skillName: "Databases",
              ),
              SizedBox(
                height: getDeviceSize(context).width < 506 ? 8 : 16,
              ),
              Column(
                children: [
                  if (getDeviceSize(context).width > 360)
                    const Row(
                      children: [
                        SkillContainer(
                          asset: "assets/icons/firebase.svg",
                          skill: "Firebase",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SkillContainer(
                          asset: "assets/icons/mongo.svg",
                          skill: "MongoDB",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SkillContainer(
                          asset: "assets/icons/sql.svg",
                          skill: "MySQL",
                        ),
                      ],
                    ),
                  if (getDeviceSize(context).width < 360) ...[
                    const Row(
                      children: [
                        SkillContainer(
                          asset: "assets/icons/firebase.svg",
                          skill: "Firebase",
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SkillContainer(
                          asset: "assets/icons/mongo.svg",
                          skill: "MongoDB",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Row(
                      children: [
                        SkillContainer(
                          asset: "assets/icons/dart_frog.svg",
                          skill: "Dart Frog",
                        ),
                      ],
                    )
                  ]
                ],
              ),
              SizedBox(
                height: getDeviceSize(context).width < 506 ? 8 : 16,
              ),
              const SkillName(
                skillName: "Version controlloing & management",
              ),
              SizedBox(
                height: getDeviceSize(context).width < 506 ? 8 : 16,
              ),
              const Row(
                children: [
                  SkillContainer(
                    asset: "assets/icons/git.svg",
                    skill: "Git",
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  SkillContainer(
                    asset: "assets/icons/github.svg",
                    skill: "GitHub",
                  ),
                ],
              ),
              SizedBox(
                height: getDeviceSize(context).width < 506 ? 8 : 16,
              ),
              const SkillName(
                skillName: "UI/UX Design",
              ),
              SizedBox(
                height: getDeviceSize(context).width < 506 ? 8 : 16,
              ),
              const Row(
                children: [
                  SkillContainer(
                    asset: "assets/icons/figma.svg",
                    skill: "Figma",
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  SkillContainer(
                    asset: "assets/icons/adobexd.svg",
                    skill: "Adobe XD",
                  ),
                ],
              ),
              SizedBox(
                height: 32.h,
              ),
              Flexible(
                child: Center(
                  child: Image.asset(
                    "assets/images/developer.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillName extends StatelessWidget {
  const SkillName({Key? key, required this.skillName}) : super(key: key);

  final String skillName;

  @override
  Widget build(BuildContext context) {
    return Text(skillName,
        style: TextStyle(
            fontFamily: 'Montserrat',
            color: const Color(0xff838383),
            fontWeight: FontWeight.w600,
            fontSize: 11.h));
  }
}

class SkillContainer extends StatelessWidget {
  const SkillContainer({Key? key, required this.asset, required this.skill})
      : super(key: key);

  final String asset;
  final String skill;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 8),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        //   color: Color(0xff585858),
        gradient: MyColors.linearGradient,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            asset,
            width: getDeviceSize(context).width < 575 ? 14 : 20,
            height: getDeviceSize(context).width < 575 ? 14 : 20,
            color: Colors.white,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            skill,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: getDeviceSize(context).width < 575 ? 13 : 14,
            ),
          ),
        ],
      ),
    );
  }
}
