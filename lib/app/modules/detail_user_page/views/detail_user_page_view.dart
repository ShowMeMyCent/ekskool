import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/detail_user_page_controller.dart';

class DetailUserPageView extends GetView<DetailUserPageController> {
  var userData = Get.arguments as Map<String, dynamic>;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Detail User',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(children: [
            //stack 1
            Column(
              children: [
                SizedBox(height: 80),
                Center(
                  child: Container(
                    width: Get.width - 60,
                    height: 500,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            //stack 2
            Column(
              children: [
                SizedBox(height: 24),
                Center(
                  child: Container(
                      child: Column(
                    children: [
                      (userData['jenis kelamin'] == 'p')
                          ? Image.asset(
                              'assets/images/female_profile.png',
                            )
                          : Image.asset(
                              'assets/images/male_profile_bs.png',
                            ),
                      SizedBox(height: 5),
                      //Nama User
                      Text(
                        '${userData['nama']}',
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 1),
                      //Nama Email User
                      Text(
                        '${userData['email']}',
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF85868B),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: Get.width - 100,
                        height: 300,
                        // color: Colors.amber,
                        child: Column(
                          children: [
                            //Data User
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //Kiri atau nama data
                                  children: [
                                    Text(
                                      'Nomor Telepon',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Jenis Kelamin',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Level',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Status',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  // Tengah atau Vertical Divider
                                  children: [
                                    Text(
                                      '|',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '|',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '|',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      '|',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //Kanan atau Isi Data
                                  children: [
                                    Text(
                                      //Nomor Telepon
                                      '${userData['no telpon']}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      userData['jenis kelamin'] == 'l'
                                          ? 'Laki-laki'
                                          : 'Perempuan',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      //Level
                                      '${userData['level']}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      //Alamat
                                      '${userData['status']}',
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.poppins(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 100),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: TextButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      title: 'Tetapkan Level',
                                      content: Column(
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Colors.blueAccent,
                                              fixedSize: Size(Get.width, 20),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {
                                              controller.assignLevel(
                                                  'pelatih', userData['id']);
                                              Get.back();
                                              Get.back();
                                            },
                                            child: Text(
                                              'PELATIH',
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Colors.blueAccent,
                                              fixedSize: Size(Get.width, 20),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {
                                              controller.assignLevel(
                                                  'user', userData['id']);
                                              Get.back();
                                              Get.back();
                                            },
                                            child: Text(
                                              'USER',
                                              style: GoogleFonts.poppins(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ));
                                },
                                child: Text(
                                  'Assign Level',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                ),
                                style: ButtonStyle(
                                    fixedSize: MaterialStatePropertyAll<Size>(
                                      Size.fromWidth(Get.width),
                                    ),
                                    backgroundColor:
                                        MaterialStatePropertyAll(Colors.blue)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
