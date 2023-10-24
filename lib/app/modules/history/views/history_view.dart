import 'package:ekskool_v1/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Color(0xFFF3F7F8),
        title: Text(
          'Riwayat',
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
      body: FutureBuilder(
          future: controller.getHistoryData(),
          builder: (context, snapshot) {
            var historyDocs = snapshot.data?.docs;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              ); // Placeholder for loading
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (historyDocs.length > 0) {
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 2),
                itemCount: historyDocs.length,
                itemBuilder: (context, index) {
                  var historyDoc = snapshot.data!.docs[index];
                  var historyItem = historyDoc.data() as Map<String, dynamic>;
                  return FutureBuilder(
                      future: Future.wait([
                        controller.getUserData(historyItem['idPelatih']),
                        controller.getEkskulData(historyItem['idEkskul']),
                      ]),
                      builder: (context, userEkskulSnapshot) {
                        if (userEkskulSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return SizedBox.shrink();
                        } else if (userEkskulSnapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          var user = userEkskulSnapshot.data![0];
                          var ekskul = userEkskulSnapshot.data![1];
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                Routes.DETAIL_HISTORY,
                                arguments: {
                                  'user': user,
                                  'ekskul': ekskul,
                                  'history': historyItem,
                                },
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 6),
                              padding: const EdgeInsets.all(15),
                              width: Get.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(10 / 100),
                                      blurRadius: 15,
                                      offset: const Offset(4, 4),
                                    ),
                                  ]),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${ekskul['nama']}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '${historyItem['tanggal']}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "${historyItem['keterangan']}",
                                    style: GoogleFonts.poppins(fontSize: 10),
                                  ),
                                  const SizedBox(height: 10),
                                  GestureDetector(
                                    onTap: () {
                                      Get.toNamed(
                                        Routes.DETAIL_HISTORY,
                                        arguments: {
                                          'user': user,
                                          'ekskul': ekskul,
                                          'history': historyItem,
                                        },
                                      );
                                    },
                                    child: Text(
                                      "Lainnya...",
                                      style: GoogleFonts.poppins(
                                        fontSize: 10,
                                        color: const Color(0xFF357AD4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      });
                },
              );
            } else {
              return Center(
                child: Text('tidak ada data'),
              );
            }
          }),
    );
  }
}
