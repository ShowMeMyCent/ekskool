import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Future catchInfoDoc() async {
    QuerySnapshot<Map<String, dynamic>> allDocs =
        await FirebaseFirestore.instance.collection('informasi').get();
    return allDocs;
  }
}
