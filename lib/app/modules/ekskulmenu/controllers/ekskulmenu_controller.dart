import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class EkskulmenuController extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchekskul() {
    var allDocs = FirebaseFirestore.instance.collection('ekskul').snapshots();
    return allDocs;
  }
}
