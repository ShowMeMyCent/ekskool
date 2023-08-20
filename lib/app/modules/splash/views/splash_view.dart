import 'package:ekskool_v1/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3),
    ).then((value) => Get.offAllNamed(Routes.LOGIN));
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo_ekskool.png',
                  height: 268,
                  width: 196,
                ),
                Text(
                  "EKSKOOL",
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 5,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
