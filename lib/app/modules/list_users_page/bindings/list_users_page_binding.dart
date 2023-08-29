import 'package:get/get.dart';

import '../controllers/list_users_page_controller.dart';

class ListUsersPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListUsersPageController>(
      () => ListUsersPageController(),
    );
  }
}
