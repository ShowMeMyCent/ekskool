import 'package:get/get.dart';

import '../controllers/ekskulmenu_controller.dart';

class EkskulmenuBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EkskulmenuController>(
      () => EkskulmenuController(),
    );
  }
}
