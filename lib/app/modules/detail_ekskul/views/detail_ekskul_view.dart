import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_ekskul_controller.dart';

class DetailEkskulView extends GetView<DetailEkskulController> {
  var ekskulData = Get.arguments as Map<String, dynamic>;

  DetailEkskulView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F7F8),
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: const Color(0xFFF3F7F8),
        title: Text(
          'Detail Ekskul',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: Get.height / 1.9,
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(10 / 100),
                    blurRadius: 15,
                    offset: const Offset(4, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.grey[300],
                    ),
                    height: 70,
                    child: Center(
                      child: Text(
                        '${ekskulData['nama']}',
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: 120,
                            // color: Colors.amber,
                            height: 100,
                            child: Column(
                              children: [
                                Text(
                                  "Jadwal Ekskul :",
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Nama Pelatih :",
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                            width: 120,
                            // color: Colors.amber,
                            height: 100,
                            child: Column(
                              children: [
                                Text(
                                  "${ekskulData['jadwal']}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                StreamBuilder(
                                    stream: controller
                                        .fetchpelatih(ekskulData['pelatih']),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const SizedBox
                                            .shrink(); // or a loading indicator
                                      } else {
                                        var querySnapshot = snapshot.data
                                            as QuerySnapshot<
                                                Map<String, dynamic>>;
                                        var documents = querySnapshot
                                            .docs; // Accessing the list of documents
                                        var firstDocumentData =
                                            documents[0].data(); // Accessing data of the first document
                                        return Text(
                                          "${firstDocumentData['nama']}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        );
                                      }
                                    }),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          DropdownSearch(
                            items: const [
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
                                  color: const Color(0xFFAAAAAA),
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
                                selectedItem,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              );
                            },
                          ),
                          StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('users')
                                .where('level', isEqualTo: 'pelatih')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text('Something went wrong');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Text("Loading");
                              }

                              var usersData = snapshot.data?.docs
                                      .map((DocumentSnapshot<
                                                  Map<String, dynamic>>
                                              doc) =>
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
                                        color: const Color(0xFFAAAAAA),
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
                                      'Ganti Pelatih',
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
                          TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                fixedSize: Size(Get.width, 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                if (controller.selecteduser != null ||
                                    controller.selectedDay.value != '') {
                                  controller.editEkskul(
                                      ekskulData['id'],
                                      controller.selecteduser,
                                      controller.selectedDay.value);
                                }
                              },
                              child: Text(
                                'Ganti',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 13,
                                ),
                              )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
