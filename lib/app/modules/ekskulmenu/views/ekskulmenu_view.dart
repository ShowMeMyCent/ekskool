import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/ekskulmenu_controller.dart';

class EkskulmenuView extends GetView<EkskulmenuController> {
  const EkskulmenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF3F7F8),
        appBar: AppBar(
          foregroundColor: Colors.black,
          elevation: 0,
          backgroundColor: Color(0xFFF3F7F8),
          title: Text(
            'Ekskul Menu',
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(15),
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
                  Text(
                    'Tambah Ekskul',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      fixedSize: Size(Get.width, 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(Routes.TAMBAH_EKSKUL);
                    },
                    child: Center(
                      child: Text(
                        "+",
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
            Divider(
              height: 40,
              thickness: 2,
            ),
            Expanded(
              child: FutureBuilder(
                  future: controller.fetchekskul(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else if (snapshot.data!.docs.length == 0) {
                      return Center(child: Text('Tidak Ada Data'));
                    } else {
                      return ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 2),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          var ekskulDoc = snapshot.data!.docs[index];
                          var ekskulItem =
                              ekskulDoc.data() as Map<String, dynamic>;
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.DETAIL_EKSKUL,
                                  arguments: ekskulItem);
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
                                        '${ekskulDoc['nama']}'.toUpperCase(),
                                        style: GoogleFonts.poppins(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      GestureDetector(
                                        onTap: () {
                                          Get.toNamed(Routes.DETAIL_EKSKUL,
                                              arguments: ekskulItem);
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
                                  const SizedBox(height: 10),
                                  Text(
                                    'Ekskul setiap hari : ${ekskulDoc['jadwal']}',
                                    style: GoogleFonts.poppins(
                                      fontSize: 10,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  }),
            ),
          ],
        ));
  }
}
