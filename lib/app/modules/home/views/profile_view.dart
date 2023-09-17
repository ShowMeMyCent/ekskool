import 'package:ekskool_v1/app/routes/app_pages.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/main_controller.dart';

class ProfileView extends GetView {
  final mainC = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF3F7F8),
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
            'Profile',
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
              child: IconButton(
                onPressed: () {
                  ///MORE OPTION
                  Get.defaultDialog(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    title: '',
                    titlePadding: EdgeInsets.zero,
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.blue,
                            fixedSize: Size(Get.width, 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(Routes.ABOUT_PAGE);
                          },
                          child: Text(
                            'About App',
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
                                const Color.fromARGB(255, 230, 26, 12),
                            fixedSize: Size(Get.width, 20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            mainC.logout();
                          },
                          child: Text(
                            'Logout',
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
                icon: Icon(FeatherIcons.moreHorizontal),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///IMAGE PROFILE
              Center(
                child: Container(
                  child: Image.asset('assets/images/male_profile_bs.png'),
                ),
              ),
              SizedBox(height: 8),

              ///LEVEL
              Center(
                child: Text(
                  'Pelatih',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF000692),
                  ),
                ),
              ),
              SizedBox(height: 20),

              ///Username
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //LABEL TEXT USERNAME
                    Text(
                      'Username',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),

                    //FORM USERNAME
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        readOnly: true,
                        initialValue: mainC.userData!['nama'],
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {}, icon: Icon(FeatherIcons.edit)),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    //LABEL TEXT EMAIL
                    Text(
                      'Email',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),

                    //FORM EMAIL
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        readOnly: true,
                        initialValue: mainC.userData!['email'],
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    Divider(
                      color: Colors.grey,
                    ),

                    SizedBox(height: 20),

                    ///MATERI
                    Text(
                      'Ekskul & Jadwal',
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding: EdgeInsets.all(15),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Computer Club',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                '|',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Selasa, 3PM - 4PM',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
