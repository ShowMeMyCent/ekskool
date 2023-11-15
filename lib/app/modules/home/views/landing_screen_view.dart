import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/landing_screen_controller.dart';
import 'home_view.dart';
import 'info_view.dart';
import 'profile_view.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';

class LandingScreenView extends GetView {
  LandingScreenView({Key? key}) : super(key: key);

  LandingScreenController landingScreenController =
      Get.put(LandingScreenController());

  final screens = [
    const InfoView(),
    HomeView(),
    ProfileView(),
  ];

  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Check if the back button is double-tapped within a certain duration
        if (currentBackPressTime == null ||
            DateTime.now().difference(currentBackPressTime!) >
                const Duration(seconds: 2)) {
          currentBackPressTime = DateTime.now();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Tap again to exit'),
            ),
          );
          return false;
        } else {
          // Exit the app if double-tapped within the specified duration
          return true;
        }
      },
      child: Scaffold(
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
              shadowColor: const Color.fromARGB(255, 166, 206, 255),
              elevation: 20,
              onTap: (index) {
                landingScreenController.changeIndex(index);
              },
              iconDurationMillSec: 10,
            ),
          ),
        ),
      ),
    );
  }
}
