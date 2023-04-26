import 'package:get/get.dart';

import '../controllers/web_miaccount_controller.dart';

class WebMiaccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WebMiaccountController>(
      () => WebMiaccountController(),
    );
  }
}
