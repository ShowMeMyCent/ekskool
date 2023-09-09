import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  var isHidden = true.obs;

  void login(email, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Check if the user has a document in Firestore with their UID
      final user = FirebaseAuth.instance.currentUser;
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();
      if (userDoc.exists) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool(user.uid, true);
        // User has completed the setup, redirect to HOME
        Get.offAllNamed(Routes.HOME);
      } else {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool(user.uid, false);
        // User has not completed the setup, redirect to a different route
        Get.offAllNamed(Routes.ISI_DATA_USER_PAGE);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
