import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekskool_v1/app/routes/app_pages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  var session = FirebaseAuth.instance.currentUser;

  Future<bool> checkuser() async {
    final user = FirebaseAuth.instance.currentUser;
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    if (userDoc.exists) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return true;
    } else {
      return false;
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
    final user = FirebaseAuth.instance.currentUser;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(user!.uid);
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
