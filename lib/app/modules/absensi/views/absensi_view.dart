import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/absensi_controller.dart';

class AbsensiView extends GetView<AbsensiController> {
  const AbsensiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F7F8),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF3F7F8),
        title: Text(
          'Absensi',
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(10 / 100),
                        blurRadius: 15,
                        offset: Offset(4, 4),
                      ),
                    ]),
                width: Get.width,
                height: Get.height,
              )
            ],
          ),
        ),
      ),
    );
  }
}
