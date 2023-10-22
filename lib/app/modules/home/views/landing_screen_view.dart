import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'package:ekskool_v1/app/modules/home/views/home_view.dart';
import 'package:ekskool_v1/app/modules/home/views/info_view.dart';
import 'package:ekskool_v1/app/modules/home/views/profile_view.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/landing_screen_controller.dart';

class LandingScreenView extends GetView {
  LandingScreenView({Key? key}) : super(key: key);

  LandingScreenController landingScreenController =
      Get.put(LandingScreenController());

  final screens = [
    InfoView(),
    HomeView(),
    ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: landingScreenController.selectedIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Obx(
          () => CircleNavBar(
            activeIcons: [
              Image.asset('assets/images/history_icon.png'),
              Image.asset('assets/images/logo_ekskool.png'),
              Image.asset('assets/images/profile_icon.png'),
            ],
            inactiveIcons: [
              Image.asset('assets/images/history_icon.png'),
              Image.asset('assets/images/logo_ekskool.png', width: 40),
              Image.asset('assets/images/profile_icon.png'),
            ],
            color: Colors.white,
            height: 70,
            circleWidth: 60,
            activeIndex: landingScreenController.selectedIndex.value,
            cornerRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            shadowColor: Color.fromARGB(255, 166, 206, 255),
            elevation: 20,
            onTap: (index) {
              landingScreenController.changeIndex(index);
            },
            iconDurationMillSec: 10,
          ),
        ),
      ),
    );
  }
}
