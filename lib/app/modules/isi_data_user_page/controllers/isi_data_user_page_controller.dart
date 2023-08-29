import 'package:get/get.dart';

class IsiDataUserPageController extends GetxController {
  final listTextTabToggle = ["Laki-laki", "Perempuan"];

  RxInt tabTextIndexSelected = 0.obs;

  toggle(int index) => tabTextIndexSelected.value = index;

  RxBool suffixIconPassword = true.obs;
}
