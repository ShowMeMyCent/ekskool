import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../controllers/main_controller.dart';

class HistoryController extends GetxController {
  final mainC = Get.find<MainController>();
  Future getHistoryData(date) async {
    if (mainC.userData['level'] == 'admin') {
      QuerySnapshot historySnapshot = await FirebaseFirestore.instance
          .collection('absensi')
          .where('tanggal', isEqualTo: date)
          .get();
      return historySnapshot;
    } else {
      QuerySnapshot historySnapshot = await FirebaseFirestore.instance
          .collection('absensi')
          .where('tanggal', isEqualTo: date)
          .where('idPelatih', isEqualTo: mainC.userData['id'])
          .get();
      return historySnapshot;
    }
  }

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate.value) {
      selectedDate.value = picked;
    }
  }

  Future getUserData(String userId) async {
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    return userSnapshot;
  }

  Future getEkskulData(String ekskulId) async {
    DocumentSnapshot ekskulSnapshot = await FirebaseFirestore.instance
        .collection('ekskul')
        .doc(ekskulId)
        .get();

    return ekskulSnapshot;
  }
}
