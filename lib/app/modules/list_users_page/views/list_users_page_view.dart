import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';

import '../controllers/list_users_page_controller.dart';

class ListUsersPageView extends GetView<ListUsersPageController> {
  const ListUsersPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          elevation: 0,
          backgroundColor: Color(0xFFF3F7F8),
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
        body: ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.symmetric(horizontal: 8),
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
                    child: Image.asset(
                      'assets/images/male_profile.png',
                      width: 35,
                    ),
                  ),
                  title: Text(
                    'Wildan Khalid Wijaya',
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
                        'wildankh01@gmail.com',
                      ),
                      Text(
                        'Pelatih',
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  subtitleTextStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(FeatherIcons.moreVertical),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: 10));
  }
}
