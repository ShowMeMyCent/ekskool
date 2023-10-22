import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_ekskul_controller.dart';

class DetailEkskulView extends GetView<DetailEkskulController> {
  const DetailEkskulView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F7F8),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF3F7F8),
        title: Text(
          'Detail Ekskul',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: 300,
        height: 400,
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(10 / 100),
              blurRadius: 15,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.grey[300],
              ),
              height: 70,
              child: Center(
                child: Text(
                  'Basket',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 120,
                      // color: Colors.amber,
                      height: 100,
                      child: Column(
                        children: [
                          Text(
                            "Jadwal Ekskul :",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Nama Pelatih :",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )),
                  Container(
                      width: 120,
                      // color: Colors.amber,
                      height: 100,
                      child: Column(
                        children: [
                          Text(
                            "Senin",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "-",
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      fixedSize: Size(Get.width, 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Tetapkan Pelatih',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
