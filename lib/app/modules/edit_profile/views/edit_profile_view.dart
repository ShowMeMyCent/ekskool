import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controllers/main_controller.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  final MainController mainC = Get.find<MainController>();

  EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F8),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: const Color(0xFFF3F7F8),
        title: Text(
          'Edit Profile',
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
              TextFormField(
                controller: controller.nameC,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: '${mainC.userData['nama']}',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFAAAAAA),
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
              const SizedBox(height: 24),

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
                    hintText: '${mainC.userData['no telpon']}',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFAAAAAA),
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
              const SizedBox(height: 24),

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
                    hintText: '${mainC.userData['alamat']}',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFFAAAAAA),
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
              const SizedBox(height: 24),

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
                      if (controller.nameC.text != '' &&
                          controller.noTelpC.text == '' &&
                          controller.alamatC.text == '') {
                        controller.editProfile(
                            controller.nameC.text,
                            mainC.userData['no telpon'],
                            mainC.userData['alamat']);
                      } else if (controller.nameC.text != '' &&
                          controller.noTelpC.text != '' &&
                          controller.alamatC.text == '') {
                        controller.editProfile(controller.nameC.text,
                            controller.noTelpC.text, mainC.userData['alamat']);
                      } else if (controller.nameC.text != '' &&
                          controller.noTelpC.text != '' &&
                          controller.alamatC.text != '') {
                        controller.editProfile(controller.nameC.text,
                            controller.noTelpC.text, controller.alamatC.text);
                      } else {
                        controller.editProfile(
                            mainC.userData['nama'],
                            mainC.userData['no telpon'],
                            mainC.userData['alamat']);
                      }
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
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
