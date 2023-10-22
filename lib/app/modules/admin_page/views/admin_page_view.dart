import 'package:ekskool_v1/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/admin_page_controller.dart';

class AdminPageView extends GetView<AdminPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F7F8),

      ///APP BAR
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF3F7F8),
        title: Text(
          'Admin Page',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
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
            const SizedBox(height: 34),

            ///TAMBAH USER
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(15),
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
                  Text(
                    'Tambah User',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      fixedSize: Size(Get.width, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                        contentPadding: EdgeInsets.all(20),
                        title: 'Tambah User',
                        titlePadding: EdgeInsets.only(top: 20),
                        titleStyle: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: controller.emailC,
                              decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                fixedSize: Size(Get.width, 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                controller.signup(controller.emailC.text);
                                Get.back();
                              },
                              child: Text(
                                'Tambahkan',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        "+",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15),

            /// TAMBAH INFORMASI
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(15),
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
                  Text(
                    'Tambah Informasi',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.TAMBAH_INFORMASI);
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      fixedSize: Size(Get.width, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "+",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),

            ///FITUR
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Fitur',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ///MENU PENGATURAN EKSKUL
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.EKSKULMENU);
                    },
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
                              'assets/images/menuSettings.png',
                              width: 10,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                'Pengaturan\nEkskul',
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

                  /// List User
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.LIST_USERS_PAGE),
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
                              'assets/images/menuListUsers.png',
                              width: 10,
                            ),
                          ),
                          Expanded(
                            child: Center(
                              child: Text(
                                'List Users',
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
            ),
          ],
        ),
      ),
    );
  }
}
