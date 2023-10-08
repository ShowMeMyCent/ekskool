import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahEkskulController extends GetxController {
  TextEditingController nameC = TextEditingController();
  RxString selectedDay = "Senin".obs;
  RxList users = [].obs;
  RxString selectedUser = ''.obs;

  void setSelectedUser(String user) {
    selectedUser.value = user;
  }

  void setSelectedDay(String day) {
    selectedDay.value = day;
  }

  void getUsersData() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .where('level', isEqualTo: 'admin')
        .get();

    users.value = querySnapshot.docs.map((doc) => doc.data()).toList();
  }
}
