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

  Future<bool> checkuser() async {
    final user = FirebaseAuth.instance.currentUser;
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user?.uid)
        .get();
    if (userDoc.exists) {
      userData = RxMap<String, dynamic>.from(userDoc.data()!);
      return true;
    } else {
      return false;
    }
  }

  void logout() async {
    final user = FirebaseAuth.instance.currentUser;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(user!.uid);
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
