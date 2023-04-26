import 'package:get/get.dart';

import '../controllers/custom_appbar_controller.dart';

class CustomAppbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomAppbarController>(
      () => CustomAppbarController(),
    );
  }
}
