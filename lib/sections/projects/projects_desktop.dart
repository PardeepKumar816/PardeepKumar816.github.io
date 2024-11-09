import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:protfolio/models/project_model.dart';
import 'package:protfolio/responsive/responsive.dart';
import 'package:protfolio/utils/device_size.dart';
import 'package:protfolio/utils/my_colors.dart';
import 'package:protfolio/widgets/image_viewer.dart';

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
        gradient: MyColors.linearGradient,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: project.images
                        .sublist(
                            0,
                            isDesktop()
                                ? getDeviceSize(context).width > 1120
                                    ? 5
                                    : 3
                                : isTablet()
                                    ? 3
                                    : getDeviceSize(context).width > 450
                                        ? 3
                                        : 2)
                        .asMap()
                        .entries
                        .map((entry) {
                      int index = entry.key;
                      String imagePath = entry.value;

                      int visibleImagesCount = isDesktop()
                          ? getDeviceSize(context).width > 1120
                              ? 5
                              : 3
                          : isTablet()
                              ? 3
                              : getDeviceSize(context).width > 450
                                  ? 3
                                  : 2;

                      int remainingImages =
                          project.images.length - visibleImagesCount;
                      bool isLastVisibleImage =
                          index == visibleImagesCount - 1 &&
                              remainingImages > 0;

                      return Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ImageViewer(
                                  images: project.images,
                                  initialIndex:
                                      project.images.indexOf(imagePath),
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.asset(
                                  imagePath,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              if (isLastVisibleImage)
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.6),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "+$remainingImages",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                if (project.isProduct)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: MyColors.yellowE3C01C,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text(
                        "Product",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  )
              ],
            ),
          ),

          // Expanded(
          //   child: Stack(
          //     children: [
          //       ClipRRect(
          //         borderRadius: const BorderRadius.all(
          //           Radius.circular(10),
          //         ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //           children: project.images
          //               .sublist(
          //                   0,
          //                   isDesktop()
          //                       ? getDeviceSize(context).width > 1120
          //                           ? 5
          //                           : 3
          //                       : isTablet()
          //                           ? 3
          //                           : 3)
          //               .map((e) {
          //             return Padding(
          //               padding: const EdgeInsets.only(top: 8),
          //               child: InkWell(
          //                 onTap: () {
          //                   Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                       builder: (context) => ImageViewer(
          //                         images: project.images,
          //                         initialIndex: project.images.indexOf(e),
          //                       ),
          //                     ),
          //                   );
          //                 },
          //                 child: ClipRRect(
          //                   borderRadius: BorderRadius.circular(4),
          //                   child: Image.asset(
          //                     e,
          //                     fit: BoxFit.cover,
          //                   ),
          //                 ),
          //               ),
          //             );
          //           }).toList(),
          //         ),
          //       ),
          //       if (project.isProduct)
          //         Positioned(
          //           top: 8,
          //           left: 8,
          //           child: Container(
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 8, vertical: 3),
          //             alignment: Alignment.center,
          //             decoration: BoxDecoration(
          //               color: MyColors.yellowE3C01C,
          //               borderRadius: BorderRadius.circular(6),
          //             ),
          //             child: const Text(
          //               "Product",
          //               style: TextStyle(
          //                   fontFamily: 'Montserrat',
          //                   color: Colors.black,
          //                   fontSize: 12,
          //                   fontWeight: FontWeight.w400),
          //             ),
          //           ),
          //         )
          //     ],
          //   ),
          // ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 24,
            ),
            decoration: BoxDecoration(
              gradient: MyColors.linearGradient,
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
                    const ProjectURLButtonWidget(
                      iconPath: "assets/icons/google_play.svg",
                      text: "Play Store",
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    const ProjectURLButtonWidget(
                      iconPath: "assets/icons/appstore.svg",
                      text: "App Store",
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
          )
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
          Text(text,
              style: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}

List<Project> projects = [
  Project(
    images: [
      "assets/images/projects/pelican/splash.jpg",
      "assets/images/projects/pelican/login.jpg",
      "assets/images/projects/pelican/accountSettings.jpg",
      "assets/images/projects/pelican/Draft.jpg",
      "assets/images/projects/pelican/Locations.jpg",
      "assets/images/projects/pelican/Form.jpg",
    ],
    name: "Pelican State Treating",
    githubLink: "",
    playStoreLink: "",
    isProduct: false,
    appStoreLink: "",
  ),
  Project(
    images: [
      "assets/images/projects/oceanicview/Splash.png",
      "assets/images/projects/oceanicview/ChooseLanguage.png",
      "assets/images/projects/oceanicview/Home.png",
      "assets/images/projects/oceanicview/UploadyourPhotosVideo.png",
      "assets/images/projects/oceanicview/PaymentMethod.png",
      "assets/images/projects/oceanicview/PayandPost.png",
      "assets/images/projects/oceanicview/ProductDetail.png",
      "assets/images/projects/oceanicview/Statistics.png",
      "assets/images/projects/oceanicview/Home-2.png",
      "assets/images/projects/oceanicview/HomewithPopup.png",
      "assets/images/projects/oceanicview/PersonalChat.png",
    ],
    name: "OceanicView",
    githubLink: "",
    playStoreLink: "",
    isProduct: false,
    appStoreLink: "",
  ),
  Project(
    images: [
      "assets/images/projects/litsports/splash.png",
      "assets/images/projects/litsports/home.png",
      "assets/images/projects/litsports/comments.png",
      "assets/images/projects/litsports/childprofile.png",
      "assets/images/projects/litsports/userprofile.png",
      "assets/images/projects/litsports/chat.png",
      "assets/images/projects/litsports/group.png",
      "assets/images/projects/litsports/quiz.png",
      "assets/images/projects/litsports/timer.png",
      "assets/images/projects/litsports/goal.png",
      "assets/images/projects/litsports/leaderboard.png",
      "assets/images/projects/litsports/parent.png",
      "assets/images/projects/litsports/coach.jpg",
    ],
    name: "ILL-Lit Sports",
    githubLink: "",
    playStoreLink: "",
    isProduct: false,
    appStoreLink: "",
  ),
  Project(
    images: [
      "assets/images/projects/thrillpay/splash.png",
      "assets/images/projects/thrillpay/login.png",
      "assets/images/projects/thrillpay/Dashboard.png",
      "assets/images/projects/thrillpay/detail.png",
      "assets/images/projects/thrillpay/Categories.png",
      "assets/images/projects/thrillpay/qr.png",
      "assets/images/projects/thrillpay/Favorites.png",
      "assets/images/projects/thrillpay/review.png",
      "assets/images/projects/thrillpay/Wallet.png",
      "assets/images/projects/thrillpay/Account.png",
    ],
    name: "ThrillPay",
    githubLink: "",
    playStoreLink: "",
    isProduct: false,
    appStoreLink: "",
  ),
  Project(
    images: [
      "assets/images/projects/checkin/qr.png",
      "assets/images/projects/checkin/checkin.png",
      "assets/images/projects/checkin/home.png",
      "assets/images/projects/checkin/orderfood.png",
      "assets/images/projects/checkin/cart.png",
      "assets/images/projects/checkin/Minibar.png",
      "assets/images/projects/checkin/Laundry.png",
      "assets/images/projects/checkin/MyBill.png",
      "assets/images/projects/checkin/PaymentMethod.png",
      "assets/images/projects/checkin/Payviacard.png",
    ],
    name: "Funotel Check-In",
    githubLink: "",
    playStoreLink: "",
    isProduct: false,
    appStoreLink: "",
  ),
  Project(
    images: [
      "assets/images/projects/checkin/qr.png",
      "assets/images/projects/checkin/checkin.png",
      "assets/images/projects/checkin/home.png",
      "assets/images/projects/checkin/orderfood.png",
      "assets/images/projects/checkin/cart.png",
      "assets/images/projects/checkin/Minibar.png",
      "assets/images/projects/checkin/Laundry.png",
      "assets/images/projects/checkin/MyBill.png",
      "assets/images/projects/checkin/PaymentMethod.png",
      "assets/images/projects/checkin/Payviacard.png",
    ],
    name: "Funotel Creator",
    githubLink: "",
    playStoreLink: "",
    isProduct: false,
    appStoreLink: "",
  ),
];
