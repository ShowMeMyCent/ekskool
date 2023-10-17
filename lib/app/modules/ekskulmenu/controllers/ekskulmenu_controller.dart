import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class EkskulmenuController extends GetxController {
  Future fetchekskul() async {
    QuerySnapshot<Map<String, dynamic>> allDocs =
        await FirebaseFirestore.instance.collection('ekskul').get();
    return allDocs;
  }
}
