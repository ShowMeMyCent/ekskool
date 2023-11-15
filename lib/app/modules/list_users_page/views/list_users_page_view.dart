import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../controllers/list_users_page_controller.dart';

class ListUsersPageView extends GetView<ListUsersPageController> {
  const ListUsersPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: const Color(0xFFF3F7F8),
        title: Text(
          'List Users',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
          stream: controller.catchAllUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error);
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return ListView.separated(
                  itemCount: snapshot.data!.docs.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    var userDoc = snapshot.data!.docs[index];
                    var userData = userDoc.data();
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.DETAIL_USER_PAGE,
                            arguments: userData);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
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
                        child: ListTile(
                          leading: CircleAvatar(
                              child: (userData['jenis kelamin'] == 'p')
                                  ? ClipOval(
                                      child: Image.asset(
                                        'assets/images/female_profile.png',
                                        width: 35,
                                      ),
                                    )
                                  : Image.asset(
                                      'assets/images/male_profile.png',
                                      width: 35,
                                    )),
                          title: Text(
                            '${userData['nama']}'.toUpperCase(),
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          isThreeLine: true,
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${userData['email']}',
                              ),
                              Text(
                                '${userData['level']}',
                                style: const TextStyle(color: Colors.blue),
                              )
                            ],
                          ),
                          subtitleTextStyle: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
