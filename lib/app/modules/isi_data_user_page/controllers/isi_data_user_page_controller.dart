import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class IsiDataUserPageController extends GetxController {
  final listTextTabToggle = ["Laki-laki", "Perempuan"];

  RxInt tabTextIndexSelected = 0.obs;

  toggle(int index) => tabTextIndexSelected.value = index;

  RxBool suffixIconPassword = true.obs;

  TextEditingController nameC = TextEditingController();
  TextEditingController newPassC = TextEditingController();
  TextEditingController noTelpC = TextEditingController();
  TextEditingController alamatC = TextEditingController();

  void addUserDetail(
    String nama,
    String noTelp,
    String alamat,
    String JK,
  ) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final users = <String, String>{
        "id": user.uid,
        "nama": nama,
        "email": user.email!,
        "no telpon": noTelp,
        "alamat": alamat,
        "jenis kelamin": JK,
        "level": 'user',
        "status": 'active',
      };

      try {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .set(users);
        Get.offAllNamed(Routes.HOME);
        // Data has been successfully added to Firestore.
      } catch (e) {
        // Handle any errors that occur during the write operation.
        Get.snackbar(
          'Error',
          'gagal memasukkan data',
          backgroundColor: Colors.white,
        );
      }
    }
  }

  void updatePassword(newPass) async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.updatePassword(newPass);
  }
}
