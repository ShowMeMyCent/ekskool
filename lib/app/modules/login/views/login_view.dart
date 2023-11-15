import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/main_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final mainC = Get.find<MainController>();

  LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F8),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150),
                Center(
                  child: Image.asset(
                    'assets/images/login_vector.png',
                    width: 204,
                    height: 184,
                  ),
                ),
                const SizedBox(height: 58),
                Center(
                  child: Text(
                    "Login  ",
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF357AD4),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
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
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 15,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0x00ff0000).withOpacity(.5),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Email-Address',
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 19,
                          color: const Color(0xFFCACACA),
                          height: .4,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F6F6),
                      borderRadius: BorderRadius.circular(14),
                    ),

                    ///PASSWORD
                    child: Obx(
                      () {
                        return TextField(
                          controller: controller.passC,
                          obscureText: controller.isHidden.value,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 15,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                controller.isHidden.toggle();
                              },
                              icon: Obx(() {
                                return Icon((controller.isHidden.value == true)
                                    ? FeatherIcons.eyeOff
                                    : FeatherIcons.eye);
                              }),
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blueGrey,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            hintText: 'Password',
                            hintStyle: GoogleFonts.poppins(
                              fontSize: 19,
                              color: const Color(0xFFCACACA),
                              height: .4,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: const Color(0xFF357AD4),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextButton(
                    onPressed: () {
                      mainC.login(
                          controller.emailC.text, controller.passC.text);
                      mainC.checkuser();
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
