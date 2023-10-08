import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/tambah_ekskul_controller.dart';

class TambahEkskulView extends GetView<TambahEkskulController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print(controller.users);
    return Scaffold(
      backgroundColor: Color(0xFFF3F7F8),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF3F7F8),
        title: Text(
          'Tambah Ekskul',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(40, 0, 41, 23),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Nama Ekskul
              Container(
                child: Text(
                  'Nama Eskul',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              TextFormField(
                controller: controller.nameC,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Contoh : Basket',
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
                    return 'Tolong masukan nama ekskul';
                  }
                  return null;
                },
              ),

              SizedBox(
                height: 20,
              ),

              /// Jadwal Ekskul
              Container(
                child: Text(
                  'Jadwal Ekskul',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              DropdownButtonFormField<String>(
                value: controller.selectedDay
                    .value, // Assuming you have a variable to store the selected day
                onChanged: (String? newValue) {
                  controller.setSelectedDay(
                      newValue!); // Assuming you have a function to update the selected day
                },
                items: <String>[
                  'Senin',
                  'Selasa',
                  'Rabu',
                  'Kamis',
                  'Jumat',
                  'Sabtu',
                  'Minggu'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Pilih Hari',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFAAAAAA),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              /// Penanggung Ekskul
              Container(
                child: Text(
                  'Pelatih Ekskul',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              DropdownButtonFormField<String>(
                value: controller.selectedUser.value,
                onChanged: (String? newValue) {
                  controller.setSelectedUser(newValue!);
                },
                items: controller.users.map<DropdownMenuItem<String>>((user) {
                  return DropdownMenuItem<String>(
                    value: user['id'],
                    child: Text(user['name']),
                  );
                }).toList(),
                icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Select a pelatih',
                  hintStyle: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFAAAAAA),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
