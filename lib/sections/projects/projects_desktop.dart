import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:protfolio/models/project_model.dart';
import 'package:protfolio/utils/device_size.dart';
import 'package:protfolio/utils/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsDesktop extends StatelessWidget {
  const ProjectsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff232129),
      body: Container(
        decoration: const BoxDecoration(
          gradient: MyColors.linearGradientDark,
        ),
        child: Center(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Projects",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: MyColors.yellowE3812A,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Stuf I'm in loved working with",
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
                const SizedBox(
                  height: 64,
                ),
                getDeviceSize(context).width > 1120
                    ? Wrap(
                        spacing: 32,
                        runSpacing: 32,
                        children: projects
                            .map(
                              (e) => ProjectCard(
                                project: e,
                              ),
                            )
                            .toList(),
                      )
                    : CarouselSlider(
                        items: List.generate(projects.length, (i) {
                          return ProjectCard(
                            project: projects[i],
                          );
                        }),
                        options: CarouselOptions(
                          autoPlay: true,
                          height: 400.h,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:
          // getDeviceSize(context).width > 750 &&
          //         getDeviceSize(context).height > 1400
          //     ? 450
          //     :
          350,
      height: 250,
      decoration: BoxDecoration(
        gradient: project.gradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                width: 1.sw,
                project.images[0],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 24,
            ),
            decoration: BoxDecoration(
              gradient: project.gradient,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  project.name,
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (project.playStoreLink.isNotEmpty) {
                          launchUrl(Uri.parse(project.playStoreLink));
                        } else {
                          Fluttertoast.showToast(
                              msg: "App will be available soon");
                        }
                      },
                      child: const ProjectURLButtonWidget(
                        iconPath: "assets/icons/google_play.svg",
                        text: "Play Store",
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    InkWell(
                      onTap: () {
                        if (project.appStoreLink.isNotEmpty) {
                          launchUrl(Uri.parse(project.appStoreLink));
                        } else {
                          Fluttertoast.showToast(
                              msg: "App will be available soon");
                        }
                      },
                      child: const ProjectURLButtonWidget(
                        iconPath: "assets/icons/appstore.svg",
                        text: "App Store",
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    if (project.githubLink.isNotEmpty)
                      const ProjectURLButtonWidget(
                        iconPath: "assets/icons/github.svg",
                        text: "Github",
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectURLButtonWidget extends StatelessWidget {
  const ProjectURLButtonWidget(
      {super.key, required this.iconPath, required this.text});

  final String iconPath;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 20,
            height: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

List<Project> projects = [
  Project(
    images: [
      "assets/images/projects/litsports/Feature Banner.jpg",
    ],
    name: "ILL-Lit Sports",
    githubLink: "",
    playStoreLink:
        "https://play.google.com/store/apps/details?id=com.production.ill_lit_sports_app&pcampaignid=web_share",
    isProduct: false,
    appStoreLink: "https://apps.apple.com/pk/app/ill-lit-sports/id6743541927",
    gradient: MyColors.linearGradient,
  ),
  Project(
      images: [
        "assets/images/projects/oceanicview/oceanicview.png",
      ],
      name: "OceanicView",
      githubLink: "",
      playStoreLink: "",
      isProduct: false,
      appStoreLink:
          "https://apps.apple.com/pk/app/oceanicview-mart/id6733253406",
      gradient: const LinearGradient(
        colors: [
          Color(0xFFFFE09D),
          Color(0xFFD9B25D),
          Color(0xFFFFF09A),
          Color(0xFFFFD980),
          Color(0xFFA57E29),
        ],
      )),
  Project(
      images: [
        "assets/images/projects/warranty/warranty.png",
      ],
      name: "Warranty Database",
      githubLink: "",
      playStoreLink:
          "https://play.google.com/store/apps/details?id=com.trango.warranty.database.app&pcampaignid=web_share",
      isProduct: false,
      appStoreLink:
          "https://apps.apple.com/pk/app/warranty-database-direct/id6504633019",
      gradient: const LinearGradient(
        colors: [
          Color(0xFFFF0020),
          Color(0xFFFF0020),
        ],
      )),

  Project(
    images: [
      "assets/images/projects/thrillpay/Feature Banner.png",
    ],
    name: "ThrillPay",
    githubLink: "",
    playStoreLink: "",
    isProduct: false,
    appStoreLink: "",
    gradient: const LinearGradient(
      colors: [
        Color(0xffF3701B),
        Color(0xffF80A60),
        Color(0xffA216DC),
      ],
    ),
  ),
  Project(
    images: [
      "assets/images/projects/pelican/pelican.jpg",
    ],
    name: "Pelican State Treating",
    githubLink: "",
    playStoreLink: "",
    isProduct: false,
    appStoreLink: "",
    gradient: const LinearGradient(
      colors: [Color(0xff335E3B), Color(0xff335E3B)],
    ),
  ),
  // Project(
  //   images: [
  //     "assets/images/projects/checkin/qr.png",
  //     "assets/images/projects/checkin/checkin.png",
  //     "assets/images/projects/checkin/home.png",
  //     "assets/images/projects/checkin/orderfood.png",
  //     "assets/images/projects/checkin/cart.png",
  //     "assets/images/projects/checkin/Minibar.png",
  //     "assets/images/projects/checkin/Laundry.png",
  //     "assets/images/projects/checkin/MyBill.png",
  //     "assets/images/projects/checkin/PaymentMethod.png",
  //     "assets/images/projects/checkin/Payviacard.png",
  //   ],
  //   name: "Funotel Check-In",
  //   githubLink: "",
  //   playStoreLink: "",
  //   isProduct: false,
  //   appStoreLink: "",
  // ),
  // Project(
  //   images: [
  //     "assets/images/projects/checkin/qr.png",
  //     "assets/images/projects/checkin/checkin.png",
  //     "assets/images/projects/checkin/home.png",
  //     "assets/images/projects/checkin/orderfood.png",
  //     "assets/images/projects/checkin/cart.png",
  //     "assets/images/projects/checkin/Minibar.png",
  //     "assets/images/projects/checkin/Laundry.png",
  //     "assets/images/projects/checkin/MyBill.png",
  //     "assets/images/projects/checkin/PaymentMethod.png",
  //     "assets/images/projects/checkin/Payviacard.png",
  //   ],
  //   name: "Funotel Creator",
  //   githubLink: "",
  //   playStoreLink: "",
  //   isProduct: false,
  //   appStoreLink: "",
  // ),
];
