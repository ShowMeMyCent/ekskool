import 'package:ekskool_v1/app/routes/app_pages.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/main_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final mainC = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF3F7F8),
        appBar: AppBar(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),
          elevation: 0,
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'Hai, ${mainC.userData['nama']}',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: '\nSelamat Datang',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: false,
          actions: [
            Container(
              padding: EdgeInsets.only(right: 20),
              child: Image.asset(
                'assets/images/male_profile.png',
                width: 35,
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),

              ///SLIDER CARD
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                height: 130,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Color(0xFF3A7FD5),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: Get.width,
                              height: Get.height,
                              child: Image.asset(
                                'assets/images/sliderCardVector.png',
                                alignment: Alignment.bottomRight,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                'Ini Ceritanya \nCard Yang \nBisa Di Slide \nGitu',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )),
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 20),
                    itemCount: 4),
              ),
              const SizedBox(height: 40),

              ///INFORMASI TERKINI
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.all(15),
                width: Get.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(10 / 100),
                        blurRadius: 15,
                        offset: const Offset(4, 4),
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Informasi Terkini',
                          style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(
                          FeatherIcons.bell,
                          size: 19,
                          color: Color(0xFFF3B65F),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer blandit velit id dolor tristique, et tihncidunt purus semper....",
                      style: GoogleFonts.poppins(fontSize: 10),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => Get.toNamed(Routes.INFO),
                      child: Text(
                        "Lainnya...",
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          color: const Color(0xFF357AD4),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fitur",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///MENU ABSENSI
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.ABSENSI),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            width: 135,
                            height: 165,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(10 / 100),
                                  blurRadius: 15,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 110,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE4E4E5),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    'assets/images/menuAbsensi.png',
                                    width: 75,
                                    height: 75,
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Absensi',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        ///MENU HISTORY
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.HISTORY),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            width: 135,
                            height: 165,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(10 / 100),
                                  blurRadius: 15,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 110,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE4E4E5),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    'assets/images/menuRiwayat.png',
                                    width: 75,
                                    height: 75,
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Riwayat',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///MENU Admin
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.ADMIN_PAGE),
                          child: Container(
                            padding: EdgeInsets.all(12),
                            width: 135,
                            height: 165,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(10 / 100),
                                  blurRadius: 15,
                                  offset: Offset(4, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  width: 110,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE4E4E5),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Image.asset(
                                    'assets/images/menuAdmin.png',
                                    width: 75,
                                    height: 75,
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'Admin',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
