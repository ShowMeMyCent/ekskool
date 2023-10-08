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
  final _formKey = GlobalKey<FormState>();
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
          child: Form(
            key: _formKey,
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
                TextFormField(
                  controller: controller.nameC,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Contoh : Lebron James',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFAAAAAA),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tolong masukan nama anda';
                    }
                    return null;
                  },
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
                Obx(
                  () {
                    return TextFormField(
                      controller: controller.newPassC,
                      obscureText: controller.suffixIconPassword.value,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            splashColor: Color(0xFFF3F7F8),
                            color: (controller.suffixIconPassword.value != true)
                                ? Colors.blue
                                : Colors.grey,
                            onPressed: () {
                              controller.suffixIconPassword.value =
                                  !controller.suffixIconPassword.value;
                            },
                            icon: Icon(
                                controller.suffixIconPassword.value == true
                                    ? FeatherIcons.eyeOff
                                    : FeatherIcons.eye),
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Masukkan Password Baru',
                          hintStyle: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFAAAAAA),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Tolong masukan password baru';
                        } else if (value == '123123') {
                          return 'Password tidak bisa 123123';
                        }
                        return null;
                      },
                    );
                  },
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
                TextFormField(
                  controller: controller.noTelpC,
                  keyboardType: TextInputType.number,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Contoh : 08xxxx',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFAAAAAA),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tolong isi no telpon anda';
                    }
                    return null;
                  },
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
                TextFormField(
                  controller: controller.alamatC,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Contoh : Gunung Sindur',
                      hintStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFAAAAAA),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tolong isi alamat anda';
                    }
                    return null;
                  },
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
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFAAAAAA)),
                      labels: controller.listTextTabToggle,
                      selectedLabelIndex: (index) => controller.toggle(index),
                      isScroll: false,
                    ),
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
                        if (_formKey.currentState!.validate()) {
                          controller.addUserDetail(
                            controller.nameC.text.toLowerCase(),
                            controller.noTelpC.text,
                            controller.alamatC.text.toLowerCase(),
                            controller.tabTextIndexSelected.value == 0
                                ? 'l'
                                : 'p',
                          );
                          controller.updatePassword(controller.newPassC.text);
                          mainC.checkuser();
                        }
                        ;
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
      ),
    );
  }
}
