import 'package:get/get.dart';

import '../controllers/isi_data_user_page_controller.dart';

class IsiDataUserPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IsiDataUserPageController>(
      () => IsiDataUserPageController(),
    );
  }
}
