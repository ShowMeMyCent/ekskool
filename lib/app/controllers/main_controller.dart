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

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
