import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailEkskulController extends GetxController {
  Stream<QuerySnapshot<Map<String, dynamic>>> fetchpelatih(idpelatih) {
    var allDocs = FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: idpelatih)
        .snapshots();
    return allDocs;
  }

  void gantiPelatih(idEkskul, idPelatih) {
    FirebaseFirestore.instance.collection('ekskul').doc(idEkskul).update({
      'pelatih': idPelatih,
    });
    Get.back();
  }

  var selecteduser;

  setSelectedUser(String user) {
    selecteduser = user;
  }
}
