import 'package:get/get.dart';

import '../controllers/tambah_ekskul_controller.dart';

class TambahEkskulBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TambahEkskulController>(
      () => TambahEkskulController(),
    );
  }
}
