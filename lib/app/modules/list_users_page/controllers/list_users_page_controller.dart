import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ListUsersPageController extends GetxController {
  Future catchAllUser() async {
    var user = FirebaseAuth.instance.currentUser;
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    var userData = RxMap<String, dynamic>.from(userDoc.data()!);
    if (userData['level'] == 'admin') {
      QuerySnapshot<Map<String, dynamic>> allDocs = await FirebaseFirestore
          .instance
          .collection('users')
          .where('level', isNotEqualTo: 'admin')
          .get();
      return allDocs;
    }
    return null;
  }
}
