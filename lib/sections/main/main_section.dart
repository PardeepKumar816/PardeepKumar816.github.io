import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:protfolio/constants/constants.dart';
import 'package:protfolio/responsive/responsive.dart';
import 'package:protfolio/sections/about/about.dart';
import 'package:protfolio/sections/contact/contact.dart';
import 'package:protfolio/sections/home/home.dart';
import 'package:protfolio/sections/home/home_desktop.dart';
import 'package:protfolio/sections/home/home_tablet.dart';
import 'package:protfolio/sections/projects/projects.dart';
import 'package:protfolio/sections/tech/tech.dart';
import 'package:protfolio/utils/device_size.dart';
import 'package:protfolio/utils/my_colors.dart';
import 'package:protfolio/widgets/drawer.dart';

part 'widgets/_body.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(); // Initialize the ScrollController
    Constants.controller = _scrollController;
  }

  @override
  void dispose() {
    _scrollController.dispose(); // Dispose of the controller when done
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Builder(builder: (context) {
        return SafeArea(
          child: Container(
            decoration:
                const BoxDecoration(gradient: MyColors.linearGradientDark),
            child: Column(
              children: [
                Responsive(
                  desktop: const HomeBar(),
                  tablet: getDeviceSize(context).width > 767
                      ? const TabletBarExtended()
                      : const TabletBar(),
                  mobile: const MobileBar(),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      _Body(scrollController: _scrollController),
                      Positioned(
                        right: 0,
                        top: 1.sh * 0.8,
                        child: InkWell(
                          onTap: () {
                            _scrollController.animateTo(
                              0,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 40,
                            height: 45,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                              ),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_drop_up,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class MobileBar extends StatelessWidget {
  const MobileBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: MyColors.linearGradientDark),
      child: Padding(
        padding: EdgeInsets.only(
            left: getDeviceSize(context).width * 0.1,
            right: getDeviceSize(context).width * 0.05,
            top: getDeviceSize(context).width * 0.03),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: const Icon(
                Icons.menu,
                color: MyColors.yellowE3812A,
              ),
            ),
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
                    color: MyColors.yellowE3812A,
                    fontWeight: FontWeight.w400,
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
          ],
        ),
      ),
    );
  }
}
