import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:protfolio/utils/device_size.dart';
import 'package:protfolio/utils/my_colors.dart';

class TechMobile extends StatelessWidget {
  const TechMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmall = getDeviceSize(context).width < 506;
    final double sectionGap = isSmall ? 8 : 16;

    return Scaffold(
        backgroundColor: const Color(0xff232129),
        body: Container(
          decoration:
              const BoxDecoration(gradient: MyColors.linearGradientDark),
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Padding(
              padding: EdgeInsets.only(left: getDeviceSize(context).width / 9),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 32),
                  Text(
                    "Tech Stack",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: MyColors.yellowE3812A,
                      fontWeight: FontWeight.w700,
                      fontSize: isSmall ? 18 : 22,
                    ),
                  ),
                  SizedBox(height: sectionGap),
                  Text(
                    "Growth happens when curiosity meets action. I dive into new technologies,\nsimplify the complex,\nand turn ideas into meaningful solutions that push boundaries :)",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: isSmall ? 10 : 12,
                    ),
                  ),
                  SizedBox(height: sectionGap),

                  // ── MOBILE ──────────────────────────────────────────────────
                  const SkillName(skillName: "Mobile"),
                  SizedBox(height: sectionGap),
                  const Row(
                    children: [
                      SkillContainer(
                          asset: "assets/icons/flutter.svg", skill: "Flutter"),
                      SizedBox(width: 12),
                      SkillContainer(
                          asset: "assets/icons/android.svg", skill: "Android"),
                      SizedBox(width: 12),
                      SkillContainer(
                          asset: "assets/icons/apple.svg", skill: "iOS"),
                    ],
                  ),
                  SizedBox(height: sectionGap),

                  // ── BACKEND ─────────────────────────────────────────────────
                  const SkillName(skillName: "Backend"),
                  SizedBox(height: sectionGap),
                  if (!isSmall) ...[
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/node.svg", skill: "Node.js"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/express.svg",
                            skill: "Express.js"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/api.svg", skill: "REST APIs"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/dart_frog.svg",
                            skill: "Dart Frog"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/firebase.svg",
                            skill: "Firebase"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/mongo.svg", skill: "MongoDB"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/sql.svg", skill: "MySQL"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/postgresql.svg",
                            skill: "PostgreSQL"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/redis.svg", skill: "Redis"),
                      ],
                    ),
                  ],
                  if (isSmall) ...[
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/node.svg", skill: "Node.js"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/express.svg",
                            skill: "Express.js"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/api.svg", skill: "REST APIs"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/dart_frog.svg",
                            skill: "Dart Frog"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/firebase.svg",
                            skill: "Firebase"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/mongo.svg", skill: "MongoDB"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/sql.svg", skill: "MySQL"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/postgresql.svg",
                            skill: "PostgreSQL"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/redis.svg", skill: "Redis"),
                      ],
                    ),
                  ],
                  SizedBox(height: sectionGap),

                  // ── AI ───────────────────────────────────────────────────────
                  const SkillName(skillName: "AI"),
                  SizedBox(height: sectionGap),
                  if (!isSmall)
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/python.svg", skill: "Python"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/langchain.svg",
                            skill: "LangChain"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/langgraph.svg",
                            skill: "LangGraph"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/langsmith.svg",
                            skill: "LangSmith"),
                      ],
                    ),
                  if (isSmall) ...[
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/python.svg", skill: "Python"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/langchain.svg",
                            skill: "LangChain"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/langgraph.svg",
                            skill: "LangGraph"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/langsmith.svg",
                            skill: "LangSmith"),
                      ],
                    ),
                  ],
                  SizedBox(height: sectionGap),

                  // ── TOOLS ────────────────────────────────────────────────────
                  const SkillName(skillName: "Tools"),
                  SizedBox(height: sectionGap),
                  if (!isSmall) ...[
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/docker.svg", skill: "Docker"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/aws.svg", skill: "AWS"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/gcp.svg", skill: "GCP"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/azure.svg", skill: "Azure"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/git.svg", skill: "Git"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/github.svg", skill: "GitHub"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/postman.svg",
                            skill: "Postman"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/figma.svg", skill: "Figma"),
                      ],
                    ),
                  ],
                  if (isSmall) ...[
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/docker.svg", skill: "Docker"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/aws.svg", skill: "AWS"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/gcp.svg", skill: "GCP"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/azure.svg", skill: "Azure"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/git.svg", skill: "Git"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/github.svg", skill: "GitHub"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/postman.svg",
                            skill: "Postman"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/figma.svg", skill: "Figma"),
                      ],
                    ),
                  ],
                  SizedBox(height: sectionGap),

                  // ── WEB & OTHERS ─────────────────────────────────────────────
                  const SkillName(skillName: "Web & Others"),
                  SizedBox(height: sectionGap),
                  if (!isSmall)
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/html.svg", skill: "HTML 5"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/css.svg", skill: "CSS 3"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/bootstrap.svg",
                            skill: "Bootstrap"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/js.svg", skill: "Javascript"),
                      ],
                    ),
                  if (isSmall) ...[
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/html.svg", skill: "HTML 5"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/css.svg", skill: "CSS 3"),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      children: [
                        SkillContainer(
                            asset: "assets/icons/bootstrap.svg",
                            skill: "Bootstrap"),
                        SizedBox(width: 12),
                        SkillContainer(
                            asset: "assets/icons/js.svg", skill: "Javascript"),
                      ],
                    ),
                  ],

                  SizedBox(height: 32.h),
                  Flexible(
                    child: Center(
                      child: Image.asset(
                        "assets/images/developer.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ),
        ));
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
          const SizedBox(width: 8),
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
