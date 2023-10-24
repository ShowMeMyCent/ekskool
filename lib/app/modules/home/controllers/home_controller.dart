import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> catchInfoDoc() {
    var allDocs =
        FirebaseFirestore.instance.collection('informasi').snapshots();
    return allDocs;
  }
}
