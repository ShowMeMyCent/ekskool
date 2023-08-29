import 'package:get/get.dart';

class LandingScreenController extends GetxController {
  ///Bottom Nav Set
  var selectedIndex = 1.obs;
  var textValue = 0.obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void increaseValue() {
    textValue.value++;
  }
}
