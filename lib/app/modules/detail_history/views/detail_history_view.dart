import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_history_controller.dart';

class DetailHistoryView extends GetView<DetailHistoryController> {
  const DetailHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F7F8),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF3F7F8),
        title: Text(
          'Detail Riwayat',
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
          children: [
            Center(
              child: Text(
                'Basket',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 10),
            //Space Untuk Foto
            Container(
              height: 150,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  //Tanggal
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range_rounded,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '12/09/2023',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //Jumlah Siswa
                  child: Row(
                    children: [
                      Icon(
                        Icons.people_alt_rounded,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '27',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  //Jam
                  child: Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 15,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '16:40 PM',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    //Headline Informasi
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Keterangan',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: Get.width,
                    height: 100,
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Color(0xFFF6F6F6),
                    ),
                    child: Text(
                      'Belajar algoritma dasar pemrograman php, dan pengenalan framework laravel, mengenal konsep dasar pemrograman dengan memisah model view controller,',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
