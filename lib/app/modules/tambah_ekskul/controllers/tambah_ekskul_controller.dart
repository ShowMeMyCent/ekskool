import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TambahEkskulController extends GetxController {
  TextEditingController nameC = TextEditingController();
  RxString selectedDay = "".obs;
  var selecteduser;

  setSelectedUser(String user) {
    selecteduser = user;
  }

  void setSelectedDay(String day) {
    selectedDay.value = day;
  }

  void tambahekskul(nama, jadwal, pelatih) {}
}
