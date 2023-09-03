import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekskool_v1/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();

  void signup(email) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: '123123',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

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
        // User has completed the setup, redirect to HOME
        Get.offAllNamed(Routes.HOME);
      } else {
        // User has not completed the setup, redirect to a different route
        SharedPreferences prefs = await SharedPreferences.getInstance();

        prefs.setBool(user.uid, false);
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

  void addUserDetail(
    String nama,
    String noTelp,
    String alamat,
    String JK,
  ) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final users = <String, String>{
        "nama": nama,
        "no telpon": noTelp,
        "alamat": alamat,
        "jenis kelamin": JK,
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
        print("Error: $e");
        Get.snackbar('Error', 'Gagal Memasukkan data');
      }
    } else {
      // Handle the case where there is no signed-in user.
      print("No signed-in user");
    }
  }

  void updatePassword(newPass) async {
    final user = FirebaseAuth.instance.currentUser;
    await user?.updatePassword(newPass);
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  Future<bool> readPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = FirebaseAuth.instance.currentUser;
    bool retrievedValue = prefs.getBool(user!.uid) ?? false;
    return retrievedValue;
  }

  void updatePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final user = FirebaseAuth.instance.currentUser;
    prefs.setBool(user!.uid, true);
  }
}
