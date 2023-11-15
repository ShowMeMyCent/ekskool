import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPageController extends GetxController {
  TextEditingController emailC = TextEditingController();

  void signup(email) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: '123123');

      Get.snackbar(
        'Success',
        'User telah ditambahkan.',
        backgroundColor: Colors.white,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Gagal',
          'Email telah dipakai',
          backgroundColor: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi error pada server',
        backgroundColor: Colors.white,
      );
    }
  }
}
