import 'package:get/get.dart';

import '../controllers/detail_user_page_controller.dart';

class DetailUserPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailUserPageController>(
      () => DetailUserPageController(),
    );
  }
}
