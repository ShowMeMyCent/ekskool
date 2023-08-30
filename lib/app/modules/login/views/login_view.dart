import 'package:ekskool_v1/app/routes/app_pages.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/main_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final mainC = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F7F8),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 150),
                Center(
                  child: Container(
                    child: Image.asset(
                      'assets/images/login_vector.png',
                      width: 204,
                      height: 184,
                    ),
                  ),
                ),
                SizedBox(height: 58),
                Center(
                  child: Text(
                    "Login",
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF357AD4),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: Container(
                    // margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(14),
                    ),

                    ///EMAIL-ADDRESS
                    child: TextField(
                      controller: controller.emailC,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 15,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF0000).withOpacity(.5),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Email-Address',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 19,
                          color: Color(0xFFCACACA),
                          height: .4,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(14),
                    ),

                    ///PASSWORD
                    child: TextField(
                      controller: controller.passC,
                      obscureText: controller.isHidden.value,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 15,
                        ),
                        suffixIcon: Obx(() {
                          return IconButton(
                            onPressed: () {
                              controller.isHidden.toggle();
                            },
                            icon: (controller.isHidden.value == true)
                                ? Icon(FeatherIcons.eyeOff)
                                : Icon(FeatherIcons.eye),
                          );
                        }),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blueGrey,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Password',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 19,
                          color: Color(0xFFCACACA),
                          height: .4,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(height: 30),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: const Color(0xFF357AD4),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextButton(
                    onPressed: () {
                      mainC.login(
                        controller.emailC.text,
                        controller.passC.text,
                      );
                    },
                    child: Text(
                      'Login',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
