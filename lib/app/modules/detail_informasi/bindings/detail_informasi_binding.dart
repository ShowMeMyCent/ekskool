import 'package:get/get.dart';

import '../controllers/detail_informasi_controller.dart';

class DetailInformasiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailInformasiController>(
      () => DetailInformasiController(),
    );
  }
}
