import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekskool_v1/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  var session = FirebaseAuth.instance.currentUser;

  RxMap<String, dynamic> userData = RxMap<String, dynamic>({});

  checkuser() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get();
      if (userDoc.exists) {
        userData = RxMap<String, dynamic>.from(userDoc.data()!);
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  void login(email, password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // Check if the user has a document in Firestore with their UID
      final user = FirebaseAuth.instance.currentUser;
      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(user!.uid)
          .get();
      if (userDoc.exists) {
        userData = RxMap<String, dynamic>.from(userDoc.data()!);
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

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
