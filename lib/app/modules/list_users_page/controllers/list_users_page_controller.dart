import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ListUsersPageController extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> catchAllUser() async* {
    var user = FirebaseAuth.instance.currentUser;
    final userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();

    var userData = userDoc.data();

    if (userData != null && userData['level'] == 'admin') {
      yield* FirebaseFirestore.instance
          .collection('users')
          .where('level', isNotEqualTo: 'admin')
          .snapshots();
    }
  }
}
