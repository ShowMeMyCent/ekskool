import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TambahInformasiController extends GetxController {
  TextEditingController judulInfo = TextEditingController();
  TextEditingController detailInfo = TextEditingController();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  Rx<DateTime> selectedDate = DateTime.now().obs;
  String getAmPmLabel(TimeOfDay time) {
    return time.hour < 12 ? 'AM' : 'PM';
  }

  void tambahInfo(judul, detail) {
    try {
      var newDocRef = FirebaseFirestore.instance.collection('informasi').doc();
      newDocRef.set({
        "idHistory": newDocRef.id,
        "tanggal": formatter.format(selectedDate.value),
        "jam":
            '${selectedTime.value.hour.toString().padLeft(2, '0')}:${selectedTime.value.minute.toString().padLeft(2, '0')} ${getAmPmLabel(selectedTime.value)}',
        "judul": judul,
        "detail": detail,
      });
      Get.back();
      // Data has been successfully added to Firestore.
      Get.snackbar(
        'Success',
        'data telah dimasukkan',
        backgroundColor: Colors.white,
      );
    } catch (e) {
      // Handle any errors that occur during the write operation.
      Get.snackbar(
        'Error',
        'Gagal memasukkan data',
        backgroundColor: Colors.white,
      );
    }
  }
}
