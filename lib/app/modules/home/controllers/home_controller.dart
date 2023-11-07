import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> catchInfoDoc() {
    var allDocs = FirebaseFirestore.instance
        .collection('informasi')
        .orderBy('tanggal', descending: true)
        .snapshots();
    return allDocs;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchNewestInfo() {
    var newestInfo = FirebaseFirestore.instance
        .collection('informasi')
        .orderBy('tanggal',
            descending: true) // Order by timestamp in descending order
        .limit(1) // Limit the result to 1 document (the newest)
        .snapshots();
    return newestInfo;
  }
}
