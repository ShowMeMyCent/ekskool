import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/tambah_ekskul_controller.dart';

class TambahEkskulView extends GetView<TambahEkskulController> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                  'Nama Ekskul',
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
              DropdownSearch(
                items: [
                  'Senin',
                  'Selasa',
                  'Rabu',
                  'Kamis',
                  'Jumat',
                ],
                onChanged: (value) {
                  controller.setSelectedDay(value!);
                },
                dropdownDecoratorProps: DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tolong pilih hari';
                  }
                  return null;
                },
                dropdownBuilder: (context, selectedItem) {
                  if (selectedItem == null) {
                    return Text('Pilih Hari',
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ));
                  }
                  return Text(
                    '$selectedItem',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  );
                },
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
              StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .where('level', isEqualTo: 'pelatih')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  var usersData = snapshot.data?.docs
                          .map((DocumentSnapshot<Map<String, dynamic>> doc) =>
                              doc.data())
                          .toList() ??
                      [];

                  List<Map<String, dynamic>> usersList = usersData
                      .map<Map<String, dynamic>>((user) => {
                            'id': user?[
                                'id'], // Assuming 'id' is the field containing unique identifiers
                            'nama': user?['nama']
                          })
                      .toList();

                  if (usersList.isEmpty) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      height: 55,
                      child: Center(
                        child: Text(
                          'No data',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFAAAAAA),
                          ),
                        ),
                      ),
                    );
                  }

                  return DropdownSearch<Map<String, dynamic>>(
                    items: usersList,
                    itemAsString: (item) => item['nama'],
                    onChanged: (Map<String, dynamic>? newValue) {
                      if (newValue != null) {
                        controller.setSelectedUser(newValue['id']);
                      }
                    },
                    dropdownDecoratorProps: DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    dropdownBuilder: (context, selectedItem) {
                      if (selectedItem == null) {
                        return Text(
                          'Pilih Pelatih',
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }
                      return Text(
                        '${selectedItem['nama']}',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Tolong pilih pelatih';
                      }
                      return null;
                    },
                  );
                },
              ),

              SizedBox(
                height: 20,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: Size(Get.width, 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.tambahekskul(controller.nameC.text,
                        controller.selectedDay.value, controller.selecteduser);
                    Get.back();
                  }
                },
                child: Center(
                  child: Text(
                    "SUBMIT",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
