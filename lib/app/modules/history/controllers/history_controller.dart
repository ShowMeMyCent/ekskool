import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  Future getHistoryData() async {
    QuerySnapshot historySnapshot =
        await FirebaseFirestore.instance.collection('absensi').get();

    return historySnapshot;
  }

  Future getUserData(String userId) async {
    DocumentSnapshot userSnapshot =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();

    return userSnapshot;
  }

  Future getEkskulData(String ekskulId) async {
    DocumentSnapshot ekskulSnapshot = await FirebaseFirestore.instance
        .collection('ekskul')
        .doc(ekskulId)
        .get();

    return ekskulSnapshot;
  }
}
