import 'package:flutter/material.dart';
import 'package:protfolio/sections/tech/tech_mobile.dart';
import 'package:protfolio/utils/device_size.dart';
import 'package:protfolio/utils/my_colors.dart';

class TechTablet extends StatelessWidget {
  const TechTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232129),
      body: Stack(children: [
        Container(
          decoration:
              const BoxDecoration(gradient: MyColors.linearGradientDark),
          child: Padding(
            padding: EdgeInsets.only(left: getDeviceSize(context).width / 9),
            child: const SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 32),
                  Text(
                    "Tech Stack",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: MyColors.yellowE3812A,
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    """Growth happens when curiosity meets action. I dive into new technologies, simplify the complex, and turn ideas into meaningful solutions that push boundaries :)""",
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12),
                  ),
                  SizedBox(height: 16),

                  // ── MOBILE ───────────────────────────────────────────────
                  SkillName(skillName: "Mobile"),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SkillContainer(asset: "assets/icons/flutter.svg", skill: "Flutter"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/android.svg", skill: "Android"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/apple.svg", skill: "iOS"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/dart.svg", skill: "Dart"),
                    ],
                  ),
                  SizedBox(height: 16),

                  // ── BACKEND ──────────────────────────────────────────────
                  SkillName(skillName: "Backend"),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SkillContainer(asset: "assets/icons/node.svg", skill: "Node.js"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/express.svg", skill: "Express.js"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/api.svg", skill: "REST APIs"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/dart_frog.svg", skill: "Dart Frog"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SkillContainer(asset: "assets/icons/firebase.svg", skill: "Firebase"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/mongo.svg", skill: "MongoDB"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/sql.svg", skill: "MySQL"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/postgresql.svg", skill: "PostgreSQL"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SkillContainer(asset: "assets/icons/redis.svg", skill: "Redis"),
                    ],
                  ),
                  SizedBox(height: 16),

                  // ── AI ───────────────────────────────────────────────────
                  SkillName(skillName: "AI"),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SkillContainer(asset: "assets/icons/python.svg", skill: "Python"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/langchain.svg", skill: "LangChain"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/langgraph.svg", skill: "LangGraph"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/langsmith.svg", skill: "LangSmith"),
                    ],
                  ),
                  SizedBox(height: 16),

                  // ── TOOLS ─────────────────────────────────────────────────
                  SkillName(skillName: "Tools"),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SkillContainer(asset: "assets/icons/docker.svg", skill: "Docker"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/aws.svg", skill: "AWS"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/gcp.svg", skill: "GCP"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/azure.svg", skill: "Azure"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      SkillContainer(asset: "assets/icons/git.svg", skill: "Git"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/github.svg", skill: "GitHub"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/postman.svg", skill: "Postman"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/figma.svg", skill: "Figma"),
                    ],
                  ),
                  SizedBox(height: 16),

                  // ── WEB & OTHERS ─────────────────────────────────────────
                  SkillName(skillName: "Web & Others"),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SkillContainer(asset: "assets/icons/html.svg", skill: "HTML 5"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/css.svg", skill: "CSS 3"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/bootstrap.svg", skill: "Bootstrap"),
                      SizedBox(width: 12),
                      SkillContainer(asset: "assets/icons/js.svg", skill: "Javascript"),
                    ],
                  ),
                  SizedBox(height: 120), // space for the overlaid image
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: 32,
          bottom: 32,
          child: Image.asset(
            "images/developer.png",
            width: getDeviceSize(context).width / 3,
            height: getDeviceSize(context).height / 3,
          ),
        ),
      ]),
    );
  }
}
