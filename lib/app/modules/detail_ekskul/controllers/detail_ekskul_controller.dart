import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailEkskulController extends GetxController {
  RxString selectedDay = ''.obs;

  void setSelectedDay(String day) {
    selectedDay.value = day;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> fetchpelatih(idpelatih) {
    var allDocs = FirebaseFirestore.instance
        .collection('users')
        .where('id', isEqualTo: idpelatih)
        .snapshots();
    return allDocs;
  }

  void editEkskul(idEkskul, idPelatih, hari) {
    if (idPelatih != null && hari == '') {
      FirebaseFirestore.instance.collection('ekskul').doc(idEkskul).update({
        'pelatih': idPelatih,
      });
    } else if (idPelatih == null && hari != '') {
      FirebaseFirestore.instance.collection('ekskul').doc(idEkskul).update({
        'jadwal': hari,
      });
    } else if (idPelatih != null && hari != '') {
      FirebaseFirestore.instance.collection('ekskul').doc(idEkskul).update({
        'pelatih': idPelatih,
        'jadwal': hari,
      });
    }
    Get.back();
  }

  var selecteduser;

  setSelectedUser(String user) {
    selecteduser = user;
  }
}
