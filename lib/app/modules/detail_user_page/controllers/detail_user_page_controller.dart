import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailUserPageController extends GetxController {
  void assignLevel(String level, String userId) {
    FirebaseFirestore.instance.collection('users').doc(userId).update({
      'level': level,
    });
  }
}
