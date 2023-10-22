import 'package:get/get.dart';

import '../controllers/detail_ekskul_controller.dart';

class DetailEkskulBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailEkskulController>(
      () => DetailEkskulController(),
    );
  }
}
