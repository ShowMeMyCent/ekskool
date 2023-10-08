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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 268,
                child: Image.asset(
                  'assets/images/logo_ekskool.png',
                  height: 268,
                  width: 196,
                ),
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
      ),
    );
  }
}
