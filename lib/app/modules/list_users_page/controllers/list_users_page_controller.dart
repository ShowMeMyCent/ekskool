import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ListUsersPageController extends GetxController {
  Future<QuerySnapshot> catchAllUser() async {
    QuerySnapshot allDocs =
        await FirebaseFirestore.instance.collection('users').get();

    return allDocs;
  }
}
