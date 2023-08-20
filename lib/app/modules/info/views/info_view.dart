import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/info_controller.dart';

class InfoView extends GetView<InfoController> {
  const InfoView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF3F7F8),
        title: Text(
          'Informasi',
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
      body: const Center(
        child: Text(
          'InfoView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
