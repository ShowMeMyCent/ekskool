import 'package:ekskool_v1/app/routes/app_pages.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

import '../../../controllers/main_controller.dart';
import '../controllers/isi_data_user_page_controller.dart';

class IsiDataUserPageView extends GetView<IsiDataUserPageController> {
  final mainC = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F7F8),

      ///APP BAR
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
          'Yuk isi data diri',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),

              ///NAMA
              Text(
                'Nama Lengkap',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: controller.nameC,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Contoh : Lebron James',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFAAAAAA),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),

              ///PASSWORD
              Text(
                'Password',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(
                  () => TextField(
                    controller: controller.newPassC,
                    obscureText: controller.suffixIconPassword.value,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        splashColor: Color(0xFFF3F7F8),
                        color: Colors.grey,
                        onPressed: () {
                          controller.suffixIconPassword.value =
                              !controller.suffixIconPassword.value;
                        },
                        icon: Icon(controller.suffixIconPassword.value == true
                            ? FeatherIcons.eyeOff
                            : FeatherIcons.eye),
                      ),
                      hintText: 'Masukkan password baru',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFAAAAAA),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),

              ///NO-TELP
              Text(
                'Nomor Telepon',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: controller.noTelpC,
                  keyboardType: TextInputType.phone,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Contoh : 08xxxxx',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFAAAAAA),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),

              ///ALAMAT
              Text(
                'Alamat',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: controller.alamatC,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Contoh : Gunung Sindur',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFAAAAAA),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24),

              ///JENIS KELAMIN
              Text(
                'Jenis Kelamin',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                height: 50,
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Obx(
                  () => FlutterToggleTab(
                    unSelectedBackgroundColors: [
                      Colors.white,
                    ],
                    width: 84.5,
                    borderRadius: 10,
                    selectedIndex: controller.tabTextIndexSelected.value,
                    selectedBackgroundColors: const [
                      Color(0xFF357AD4),
                      Color(0xFF27B1E0),
                    ],
                    selectedTextStyle: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    unSelectedTextStyle: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600, color: Color(0xFFAAAAAA)),
                    labels: controller.listTextTabToggle,
                    selectedLabelIndex: (index) => controller.toggle(index),
                    isScroll: false,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Obx(
                () => Text(
                  "Index selected : ${controller.tabTextIndexSelected.value == 0 ? 'L' : 'P'}",
                ),
              ),
              SizedBox(height: 24),

              ///BUTTON SIMPAN

              Container(
                  height: 50,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextButton(
                    onPressed: () {
                      mainC.addUserDetail(
                        controller.nameC.text,
                        controller.noTelpC.text,
                        controller.alamatC.text,
                        controller.tabTextIndexSelected.value.toString(),
                      );
                      mainC.updatePassword(controller.newPassC.text);
                      mainC.updatePrefs();
                    },
                    child: Text(
                      'Simpan',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  )),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
