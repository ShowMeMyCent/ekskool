import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AbsensiController extends GetxController {
  TextEditingController keterangan = TextEditingController();
  TextEditingController jmlSiswa = TextEditingController();

  var selectedekskul;

  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  setSelectedEkskul(String id) {
    selectedekskul = id;
  }

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

  Future<void> absensi(idEkskul, tgl, jam, jmlSiswa, ket) async {
    var user = FirebaseAuth.instance.currentUser;
    try {
      var newDocRef = FirebaseFirestore.instance.collection('absensi').doc();
      newDocRef.set({
        "idHistory": newDocRef.id,
        "idEkskul": idEkskul,
        "idPelatih": user!.uid,
        "tanggal": tgl,
        "jam": jam,
        "jumlah": jmlSiswa,
        "keterangan": ket,
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

  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );

    if (picked != null && picked != selectedTime.value) {
      selectedTime.value = picked;
    }
  }
}
