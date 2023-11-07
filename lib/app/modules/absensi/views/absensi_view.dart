import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:intl/intl.dart';

import '../../../controllers/main_controller.dart';
import '../controllers/absensi_controller.dart';

class AbsensiView extends GetView<AbsensiController> {
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  String getAmPmLabel(TimeOfDay time) {
    return time.hour < 12 ? 'AM' : 'PM';
  }

  final _formKey = GlobalKey<FormState>();

  final mainC = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F7F8),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF3F7F8),
        title: Text(
          'Absensi',
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
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Container(
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
                width: Get.width,
                height: Get.height / 1.25,
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///Text Data Ekskul
                        Center(
                          child: Text(
                            'Data Ekskul',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        Text(
                          'Ekskul',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.zero,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.25),
                                    blurRadius: 4,
                                    offset: Offset(0, 4)),
                              ]),
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('ekskul')
                                .where('pelatih',
                                    isEqualTo: '${mainC.userData['id']}')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height: 55,
                                  child: Center(
                                    child: Text(
                                      'Terjadi Error',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFAAAAAA),
                                      ),
                                    ),
                                  ),
                                );
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  height: 55,
                                  child: Center(
                                    child: Text(
                                      'Loading',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFFAAAAAA),
                                      ),
                                    ),
                                  ),
                                );
                              }

                              var ekskulData = snapshot.data?.docs
                                      .map((DocumentSnapshot<
                                                  Map<String, dynamic>>
                                              doc) =>
                                          doc.data())
                                      .toList() ??
                                  [];

                              List<Map<String, dynamic>> ekskulList = ekskulData
                                  .map<Map<String, dynamic>>((ekskul) => {
                                        'id': ekskul?[
                                            'id'], // Assuming 'id' is the field containing unique identifiers
                                        'nama': ekskul?['nama']
                                      })
                                  .toList();

                              if (ekskulList.isEmpty) {
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
                                items: ekskulList,
                                itemAsString: (item) => item['nama'],
                                onChanged: (Map<String, dynamic>? newValue) {
                                  if (newValue != null) {
                                    controller
                                        .setSelectedEkskul(newValue['id']);
                                  }
                                },
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  dropdownSearchDecoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide.none,
                                    ),
                                  ),
                                ),
                                dropdownBuilder: (context, selectedItem) {
                                  if (selectedItem == null) {
                                    return Text(
                                      'Pilih Ekskul',
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
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 15),

                        ///Tanggal
                        Text(
                          'Tanggal',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),

                        GestureDetector(
                          onTap: () async {
                            // Show date picker and update selected date
                            final selectedDate = await showDatePicker(
                              context: context,
                              initialDate: controller.selectedDate.value,
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2024, 12,
                                  31), // Set lastDate to December 31, 2023
                            );
                            if (selectedDate != null) {
                              controller.selectedDate.value = selectedDate;
                              // Fetch data when date changes
                            }
                          },
                          child: Obx(
                            () {
                              return Container(
                                padding: EdgeInsets.zero,
                                height: 50,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F6F6),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.25),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Icon(
                                          FontAwesome.calendar,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${formatter.format(controller.selectedDate.value.toLocal())}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        SizedBox(height: 15),

                        ///Jam
                        Text(
                          'Jam',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        GestureDetector(
                          onTap: () async {
                            // Show time picker and update selected time
                            final selectedTime = await showTimePicker(
                              initialEntryMode: TimePickerEntryMode.inputOnly,
                              context: context,
                              initialTime: TimeOfDay.now(),
                              builder: (BuildContext context, Widget? child) {
                                return MediaQuery(
                                  data: MediaQuery.of(context).copyWith(
                                    alwaysUse24HourFormat: true,
                                  ),
                                  child: child!,
                                );
                              },
                            );
                            if (selectedTime != null) {
                              // Update selected time
                              controller.selectedTime.value = selectedTime;
                              // Fetch data or perform any other action when time changes
                            }
                            print(controller.selectedTime);
                          },
                          child: Obx(
                            () {
                              return Container(
                                padding: EdgeInsets.zero,
                                height: 50,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF6F6F6),
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.25),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      children: [
                                        Icon(
                                          FontAwesome.clock,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${controller.selectedTime.value.hour.toString().padLeft(2, '0')}:${controller.selectedTime.value.minute.toString().padLeft(2, '0')} ${getAmPmLabel(controller.selectedTime.value)}',
                                          style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 15),

                        ///Jumlah Siswa
                        Text(
                          'Jumlah Siswa Hadir',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.zero,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.25),
                                    blurRadius: 4,
                                    offset: Offset(0, 4)),
                              ]),
                          child: TextFormField(
                            controller: controller.jmlSiswa,
                            scrollPadding: EdgeInsets.zero,
                            maxLines: 1,
                            keyboardType: TextInputType.number,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                FontAwesome.users,
                                color: Colors.grey,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 15),

                        ///Jumlah Siswa
                        Text(
                          'Dokumentasi',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            controller.pickImage();
                          },
                          child: Container(
                            padding: EdgeInsets.zero,
                            height: 50,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(.25),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: [
                                    Icon(
                                      FontAwesome.camera_retro,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Obx(() => Text(
                                          '${controller.pickedImageName.value}',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),

                        ///Keterangan
                        Text(
                          'Keterangan',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          padding: EdgeInsets.zero,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Color(0xFFF6F6F6),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.25),
                                    blurRadius: 4,
                                    offset: Offset(0, 4)),
                              ]),
                          child: TextField(
                            controller: controller.keterangan,
                            scrollPadding: EdgeInsets.zero,
                            maxLines: 3,
                            keyboardType: TextInputType.multiline,
                            style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                FontAwesome.book_bookmark,
                                color: Colors.grey,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),

                        ///BUTTON SIMPAN

                        Container(
                            height: 45,
                            width: Get.width,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                if (controller.selectedekskul != null &&
                                    controller.jmlSiswa.text != '' &&
                                    controller.keterangan.text != '') {
                                  controller.absensi(
                                      controller.selectedekskul,
                                      formatter.format(controller
                                          .selectedDate.value
                                          .toLocal()),
                                      '${controller.selectedTime.value.hour.toString().padLeft(2, '0')}:${controller.selectedTime.value.minute.toString().padLeft(2, '0')} ${getAmPmLabel(controller.selectedTime.value)}',
                                      controller.jmlSiswa.text,
                                      controller.keterangan.text);
                                } else {
                                  Get.snackbar(
                                    'Error',
                                    'Tolong lengkapi data',
                                    backgroundColor: Colors.white,
                                  );
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
                      ],
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
